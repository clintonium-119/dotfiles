#!/bin/bash
options="🔇 Silent\n⚖️ Balanced\n🚀 Performance\n⚡ Turbo 95W\n🔋 Limit 80%\n🔌 Limit 100%"

selected=$(echo -e "$options" | rofi -dmenu -p "ROG Control")

case $selected in
  "🔇 Silent") asusctl profile -P Quiet && notify-send "ROG" "Silent Mode" ;;
  "⚖️ Balanced") asusctl profile -P Balanced && notify-send "ROG" "Balanced Mode" ;;
  "🚀 Performance") asusctl profile -P Performance && notify-send "ROG" "Performance Mode" ;;
  "⚡ Turbo 95W") 
      asusctl profile -P Performance
      asusctl power-limits -s 95000 
      notify-send "ROG" "Turbo 95W Active" ;;
  "🔋 Limit 80%") asusctl -c 80 && notify-send "Battery" "Capped at 80%" ;;
  "🔌 Limit 100%") asusctl -c 100 && notify-send "Battery" "Uncapped" ;;
esac
