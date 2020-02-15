#!/bin/bash

# Build the single EasyPost executable
# https://askubuntu.com/questions/950432/how-can-i-copy-the-content-of-a-text-file-and-paste-it-to-another-starting-at-a
head -n 5 ~/a > ~/c
cat ~/b >> ~/c
tail --lines=+6 ~/a >> ~/c
