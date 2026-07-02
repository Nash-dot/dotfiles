#!/usr/bin/env bash

## Rofi   : Launcher (Modi Drun, Run, File Browser, Window#
## Available Styles
dir="$HOME/.config/rofi/launcher/"
theme='style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
