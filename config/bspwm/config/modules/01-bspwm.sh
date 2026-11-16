#!/bin/sh

# The rice's theme-config.bash gives these as design sizes; scale_px turns
# them into pixels for the current screen (see ~/.config/rice/scale).
bspc config border_width "$(scale_px "${BORDER_WIDTH}")"
bspc config top_padding "$(scale_px "${TOP_PADDING}")"
bspc config bottom_padding "$(scale_px "${BOTTOM_PADDING}")"
bspc config left_padding "$(scale_px "${LEFT_PADDING}")"
bspc config right_padding "$(scale_px "${RIGHT_PADDING}")"
bspc config normal_border_color "${NORMAL_BC}"
bspc config focused_border_color "${FOCUSED_BC}"
bspc config presel_feedback_color "${blue}"
