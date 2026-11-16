#!/bin/sh

_target="$HOME/.config/jgmenu/jgmenurc"
_prepend="$HOME/.config/jgmenu/prepend.csv"

{
    sed '/^# Colors$/,$d' "$_target"
    cat << EOF
# Colors
color_menu_border = ${accent_color}
color_menu_bg = ${jg_bg}
color_norm_fg = ${jg_fg}
color_sel_bg = ${jg_sel_bg}
color_sel_fg = ${jg_sel_fg}
color_sep_fg = ${jg_sep}
color_norm_bg = #ffffff 0
EOF
    # Sizes: the keys above the "# Colors" line are design sizes and stay as
    # written. On a scaled display they are re-stated here, multiplied by the
    # display scale (~/.config/rice/scale) -- jgmenu lets a later line win.
    # This block is rewritten together with the colors on every theme load.
    if [ "$RICE_SCALE" != 1 ]; then
        echo "# Sizes x display scale ${RICE_SCALE}"
        sed '/^# Colors$/,$d' "$_target" | awk -v s="$RICE_SCALE" '
            function px(v,    r) { r = int(v * s + 0.5); if (v > 0 && r < 1) r = 1; return r }
            /^(menu_width|menu_padding_[a-z]+|menu_radius|menu_border|menu_margin_[xy]|item_margin_[xy]|item_height|item_padding_x|item_radius|item_border|sep_height|sub_spacing|icon_size|arrow_width)[ \t]*=[ \t]*[0-9]+[ \t]*$/ {
                split($0, kv, "="); gsub(/[ \t]/, "", kv[1]); print kv[1] " = " px(kv[2] + 0)
            }
            /^font[ \t]*=.*[0-9]+px/ {
                match($0, /[0-9]+px/)
                print substr($0, 1, RSTART - 1) px(substr($0, RSTART, RLENGTH - 2) + 0) substr($0, RSTART + RLENGTH - 2)
            }'
    fi
} | _write "$_target"

awk -F',' -v OFS=',' -v color="$jg_fg" '
    /^@search,/ { $10 = color }
    { print }
' "$_prepend" |
_write "$_prepend"
