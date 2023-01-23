#!/bin/bash

./main.riscv &
curl localhost:8080
curl localhost:8080/bird
curl localhost:8080/hello
poweroff
