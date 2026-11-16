#!/bin/sh

# Sizes are design sizes times the display scale (scale_px). The shadow has
# no per-rice setting; a rice may set P_SHADOW_R to override its radius.
_shadow_r=$(scale_px "${P_SHADOW_R:-7}")
sed -i "$HOME/.config/bspwm/config/picom/picom.conf" \
    -e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/" \
    -e "s/^shadow-radius = .*/shadow-radius = ${_shadow_r};/" \
    -e "s/^shadow-offset-x = .*/shadow-offset-x = -${_shadow_r};/" \
    -e "s/^shadow-offset-y = .*/shadow-offset-y = -${_shadow_r};/" \
    -e "s/^corner-radius = .*/corner-radius = $(scale_px "${P_CORNER_R}")/"
unset _shadow_r

sed -i "$HOME/.config/bspwm/config/picom/picom-rules.conf" \
    -e "/#-shadow-switch/s/.*#-/\t\tshadow = ${P_SHADOWS};\t#-/" \
    -e "/#-fade-switch/s/.*#-/\t\tfade = ${P_FADE};\t#-/" \
    -e "/#-blur-switch/s/.*#-/\t\tblur-background = ${P_BLUR};\t#-/" \
    -e "/picom-animations/c\\        ${P_ANIMATIONS}include \"picom-animations.conf\""

_write "$HOME/.config/bspwm/config/picom/picom-dunst-animations.conf" <<-EOF
    animations = (

        {
            triggers = ["close", "hide"];
            preset = "${dunst_close_preset}";
            direction = "${dunst_close_direction}";
            duration = 0.2;
        },

        {
            triggers = ["open", "show"];
            preset = "${dunst_open_preset}";
            direction = "${dunst_open_direction}";
            duration = 0.2;
        }
    )
EOF
