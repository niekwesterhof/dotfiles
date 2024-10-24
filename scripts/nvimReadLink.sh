#!/bin/bash

path=$(readlink -f "$1")
nvim "$path"
