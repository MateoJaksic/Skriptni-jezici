#!/bin/bash

echo ""

grep -iE 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

echo ""

grep -vE 'banana|jabuka|jagoda|dinja|lubenica' namirnice.txt

echo ""

grep -rE '\b[A-Z]{3}[0-9]{6}\b' ~/projekti/

echo ""

find ~ \( -mtime +7 -a -mtime -14 \) -ls

echo ""

for i in $(seq 1 15); do echo $i; done

echo ""

kraj=15; for i in $(seq 1 $kraj); do echo $i; done

echo ""