#!/bin/bash
mem_free=$(awk '/MemFree/ { printf "%.1f \n", $2/1024/1024 }' /proc/meminfo)
mem_total=$(awk '/MemTotal/ { printf "%.1f \n", $2/1024/1024 }' /proc/meminfo)
mem_used=$(awk '/Active/ { printf "%.1f \n", $2/1024/1024 }' /proc/meminfo)
echo memory free: $mem_free Gb
echo memort total: $mem_total Gb
echo men used: $mem_used Gb
