#!/bin/bash
apps=( "$@" )
if ((${#apps[@]} == 0)) ; then
  echo "No apps provided launching default ones...";
  apps=( liidio aurum stannum mailcatcher plumbum gacon )
fi
for i in "${apps[@]}"
do
  echo "Launching: $i";
osascript <<EOF
  tell application "iTerm" to activate
  tell application "System Events" to tell process "iTerm" to keystroke "t" using command down
  tell application "System Events" to tell process "iTerm" to keystroke "tmuxinator start ${i}"
  tell application "System Events" to tell process "iTerm" to key code 52
EOF
done
