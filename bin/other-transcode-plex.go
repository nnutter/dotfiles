///usr/bin/true; go run $0 "$@" ; exit
package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"path"
	"strings"
)

const mode = 0700

func main() {
	if len(os.Args) == 1 {
		fmt.Println("usage: other-transcode-replace.go [options] <file>")
		os.Exit(1)
	}

	last := len(os.Args) - 1
	args := os.Args[1:last]
	src := os.Args[last]

	basedir := strings.TrimSuffix(src, ".mkv")
	_, name := path.Split(basedir)
	other := path.Join(basedir, "Other", name+".mkv")
	args = append(args, other)
	c := exec.Command("other-transcode", args...)
	c.Stdout = os.Stdout

	err := func() error {
		err := os.Mkdir(basedir, mode)
		if err != nil {
			return err
		}

		err = os.Mkdir(path.Join(basedir, "Other"), mode)
		if err != nil {
			return err
		}

		err = os.Rename(src, other)
		if err != nil {
			return err
		}

		err = os.Chdir(basedir)
		if err != nil {
			return err
		}

		err = c.Run()
		if err != nil {
			return err
		}

		return os.Rename(other, path.Join(basedir, "Other", "Original.mkv"))
	}()
	if err != nil {
		log.Fatalf("%+v", err)
	}
}
