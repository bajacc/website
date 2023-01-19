---
title: Simple screenshot taker for dmenu
description: Explain how to take screenshop with dmenu 
date: 2023-01-19
tag: dmenu, maim
---

# Take Screenshot from `dmenu`

## Explanation

I use a slightly modified version of the screenshot taker from [larbs](https://larbs.xyz/)

when executed, you have three options. You can take a screenshot of:

- A selected area
- The current window
- The full screen

Then the picture is saved in  `$XDG_SCREENSHOT_DIR` . This variable should be initialized before. taking a screenshot will open a window to be able to drop the image to your favorite messaging app.

## Tools

- `maim`: to take a screenshot
- `dmenu`: to give the menu option
- `xclip`: to copy the image to clipboard
- `dragon-drop`: to drag and drop the image once the screenshot has been taken 

## code

```bash
#!/bin/sh

case "$(printf "a selected area\\ncurrent window\\nfull screen" | dmenu -l 3 -i -p "Screenshot which area?")" in
	"a selected area")
		PIC_NAME=$XDG_SCREENSHOT_DIR/pic-selected-"$(date '+%y%m%d-%H%M-%S').png" 
		maim -s $PIC_NAME
		dragon-drop $PIC_NAME
	;;

	"current window") 
		WINDOW_ID="$(xdotool getactivewindow)" 
		PIC_NAME=$XDG_SCREENSHOT_DIR/pic-window-"$(date '+%y%m%d-%H%M-%S').png"
		maim -i $WINDOW_ID $PIC_NAME
		dragon-drop $PIC_NAME
	;;
	"full screen") 
		PIC_NAME=$XDG_SCREENSHOT_DIR/pic-full-"$(date '+%y%m%d-%H%M-%S').png"
		maim $PIC_NAME
		dragon-drop $PIC_NAME
	;;
esac

```

