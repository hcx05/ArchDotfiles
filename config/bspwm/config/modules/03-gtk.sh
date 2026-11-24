#!/bin/sh

# Set the gtk theme corresponding to rice
# Display scale: xsettingsd is how running GTK3/GTK4/Firefox/Chromium/Qt apps
# learn the window scale and DPI (and re-layout live when it changes).
# XSETTINGS counts DPI in 1/1024ths.
#   Gdk/WindowScalingFactor: integer HiDPI multiplier for widgets, icons, chrome
#   Gdk/UnscaledDPI:         logical DPI before WindowScalingFactor is applied,
#                            so fonts render at UnscaledDPI * WindowScalingFactor
#                            == RICE_DPI with zero double-scaling
#   Xft/DPI:                 full physical DPI for GTK2 / legacy Xft consumers
_xs="$HOME"/.config/bspwm/config/xsettingsd
_cursor="${RICE_CURSOR_SIZE:-$(xrdb -query 2>/dev/null | awk '$1 == "Xcursor.size:" { print $2; exit }')}"
_int_scale="${RICE_INT_SCALE:-1}"
_unscaled_dpi="${RICE_UNSCALED_DPI:-$RICE_DPI}"
grep -q '^Gdk/WindowScalingFactor ' "$_xs" || echo 'Gdk/WindowScalingFactor 1' >> "$_xs"
grep -q '^Gdk/UnscaledDPI ' "$_xs" || echo 'Gdk/UnscaledDPI 98304' >> "$_xs"
grep -q '^Xft/DPI ' "$_xs" || echo 'Xft/DPI 98304' >> "$_xs"
grep -q '^Gtk/CursorThemeSize ' "$_xs" || echo 'Gtk/CursorThemeSize 24' >> "$_xs"

sed -i "$_xs" \
    -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|" \
    -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|" \
    -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|" \
    -e "s|^Gdk/WindowScalingFactor .*|Gdk/WindowScalingFactor ${_int_scale}|" \
    -e "s|^Gdk/UnscaledDPI .*|Gdk/UnscaledDPI $((_unscaled_dpi * 1024))|" \
    -e "s|^Xft/DPI .*|Xft/DPI $((RICE_DPI * 1024))|" \
    -e "s|^Gtk/CursorThemeSize .*|Gtk/CursorThemeSize ${_cursor:-24}|"
unset _xs _cursor _int_scale _unscaled_dpi

sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/" "$HOME"/.icons/default/index.theme

# Reload daemon and apply gtk theme
if pidof -q xsettingsd; then
    pkill -1 xsettingsd
fi
xsetroot -cursor_name left_ptr
