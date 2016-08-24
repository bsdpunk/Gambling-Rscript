#!/bin/bash
awk -F "\"*,\"*" '{print $1,"," $2,"," $3,"," $5}' DKSalaries.csv | sed "s/\"QB /QB/g" | sed "s/\"RB /RB/g" | sed "s/\"WR /WR/g" | sed "s/\"TE /TE/g" | sed "s/\"DST /DST/g" > nflredux


cat nflredux | grep -P "^WR|^QB|^RB|^TE" | sed "s/^[Q|R|T|W][B|E|R]/FLEX/" >> nflredux


