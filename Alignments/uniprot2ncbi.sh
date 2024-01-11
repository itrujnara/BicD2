#!/bin/bash

for i in $(cat $1 | cut -f 1); do grep $i idmap.txt | awk '{print substr($3, 1, length($3)-1)}'; done > $2
