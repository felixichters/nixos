#!/bin/sh

# Prompt for a command
app=$(sh -c 'echo "" && read -p "Launch app: " input && echo $input')

# Check if a command was entered
if [ -n "$app" ]; then
  # Run the command in the background
  $app &
fi
