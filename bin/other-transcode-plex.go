///usr/bin/true; go run $0 "$@" ; exit
package main

import (
	"bufio"
	"context"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"os/signal"
	"path"
	"strings"
	"syscall"
	"time"
)

const mode = 0700

func main() {
	fs := flag.NewFlagSet("other-transcode-plex.go [options] <file>", flag.ContinueOnError)
	tv := fs.Bool("tv", false, "enable TV Shows mode")
	err := fs.Parse(os.Args[1:])
	switch err {
	case nil:
	case flag.ErrHelp:
		os.Exit(0)
	default:
		fmt.Println(err)
		os.Exit(1)
	}
	if len(os.Args) == 1 {
		fs.Usage()
		os.Exit(1)
	}

	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	sig := make(chan os.Signal, 1)
	signal.Ignore(os.Interrupt)
	signal.Notify(sig, os.Interrupt)

	go func() {
		select {
		case <-sig:
			fmt.Printf("\nSignal received, will exit after current file...\n")
			cancel()
		case <-ctx.Done():
		}
	}()

	f, err := os.Open(os.Args[fs.NArg()+1])
	if err != nil {
		log.Fatalf("%v", err)
	}

	s := bufio.NewScanner(f)
	for s.Scan() {
		if err := convertFile(ctx, *tv, s.Text()); err != nil && err != context.Canceled {
			log.Fatalf("%v", err)
		}
		if err := ctx.Err(); err != nil {
			os.Exit(0)
		}
	}
	if err := s.Err(); err != nil {
		log.Fatalf("%v", err)
	}
}

func convertFile(ctx context.Context, tv bool, src string) error {
	_, name := path.Split(src)

	basedir := strings.TrimSuffix(src, ".mkv")
	if tv {
		basedir = path.Dir(src)
	}

	other := path.Join(basedir, "Other", name)
	args := []string{
		"--crop", "auto",
		other,
	}
	c := exec.Command("other-transcode", args...)
	c.SysProcAttr = &syscall.SysProcAttr{
		Setpgid: true,
	}
	c.Stdout = os.Stdout

	logPath := src + ".log"
	if _, err := os.Stat(logPath); err == nil {
		log.Printf("log already exists: %s", logPath)
		return nil
	}

	fmt.Printf("Will begin transcoding '%s' in...", src)
	for i := 3; i > 0; i-- {
		if err := ctx.Err(); err != nil {
			return err
		}
		fmt.Printf("%d...", i)
		time.Sleep(time.Second)
	}
	fmt.Println("")

	err := os.Mkdir(basedir, mode)
	if err != nil && !os.IsExist(err) {
		return fmt.Errorf("mkdir %s: %w", basedir, err)
	}

	err = os.Mkdir(path.Dir(other), mode)
	if err != nil && !os.IsExist(err) {
		return fmt.Errorf("mkdir %s: %w", path.Dir(other), err)
	}

	err = os.Rename(src, other)
	if err != nil {
		return fmt.Errorf("rename: %w", err)
	}

	err = os.Chdir(basedir)
	if err != nil {
		return fmt.Errorf("chdir %s: %w", basedir, err)
	}

	err = c.Run()
	if err != nil {
		return fmt.Errorf("%s: %w", c.String(), err)
	}

	err = os.Remove(other)
	if err != nil {
		return fmt.Errorf("remove %s: %w", other, err)
	}

	return nil
}
