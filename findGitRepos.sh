#!/bin/bash
find ~ -type d -name .git | xargs -n 1 dirname > gits.txt

