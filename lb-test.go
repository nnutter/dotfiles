package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

var attempts = 10
var ports = []string{
	"80",
	"443",
	"3306",
	"5432",
	"8443",
	"8843",
	"9200",
	"9300",
	"10000",
	"10001",
	"10002",
	"10003",
	"30000",
	"30001",
	"30002",
	"30003",
}
var loadBalancers = []string{
	"dc2kubenodepd.it.savvis.net",
	"dl1kubenodeqa.it.savvis.net",
	"sc8kubenodedr.it.savvis.net",
}
var loadBalancerNodes = make(map[loadBalancerResult]int)

type loadBalancerResult struct {
	requestHostname  string
	requestPort      string
	responseHostname string
	success          bool
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		c := make(chan loadBalancerResult)
		for i := 0; i < attempts; i++ {
			for _, hostname := range loadBalancers {
				for _, port := range ports {
					go doIt(hostname, port, c)
				}
			}
			time.Sleep(500 * time.Millisecond)
		}
		for i := 0; i < attempts*len(ports)*len(loadBalancers); i++ {
			r := <-c
			if r.success {
				loadBalancerNodes[r]++
			}
		}
		for r, count := range loadBalancerNodes {
			fmt.Fprintf(w, "%s %s %s %d\n", r.requestHostname, r.requestPort, r.responseHostname, count)
		}
	})
	http.ListenAndServe(":8080", nil)
}

func doIt(hostname, port string, c chan loadBalancerResult) {
	url := "http://" + hostname + ":" + port + "/hostname.txt"
	client := &http.Client{
		Timeout: 3 * time.Second,
	}
	resp, err := client.Get(url)
	if err == nil {
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err == nil {
			c <- loadBalancerResult{hostname, port, strings.TrimSpace(string(body)), true}
		} else {
			c <- loadBalancerResult{hostname, port, "", false}
		}
	} else {
		c <- loadBalancerResult{hostname, port, "", false}
	}
}
