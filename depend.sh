#!/bin/bash

# Install dependencies for program
#
# I don't like bash scripting
# @QWERTYghri 2022

#Specify Package manager
PM="pacman"
PMINSTALL="-S"

LR="luarocks"
LFS="luafilesystem"
LFSINSTALL="install"


#Lua file system hasn't been updated in two years but still
LFSVER="1.8.0-1"

if ! command -v $(luarocks)
