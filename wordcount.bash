#!/bin/bash
cat *.tex | wc| awk '{print $2}'