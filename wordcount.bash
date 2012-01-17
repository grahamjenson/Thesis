#!/bin/bash
cat *.tex | grep -v ^% | wc| awk '{print $2}'