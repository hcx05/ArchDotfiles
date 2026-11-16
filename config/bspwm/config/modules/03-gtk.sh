#!/bin/sh

# Set the gtk theme corresponding to rice
# Display scale: xsettingsd is how running GTK/Qt apps learn the DPI (and
# re-layout live when it changes). XSETTINGS counts DPI in 1/1024ths. The
# cursor size is the one autoscale already published to the X resources.
_xs="$HOME"/.config/bspwm/config/xsettingsd
_cursor=$(xrdb -query 2>/dev/null | awk '$1 == "Xcursor.size:" { print $2; exit }')
grep -q '^Xft/DPI ' "$_xs" || echo 'Xft/DPI 98304' >> "$_xs"
grep -q '^Gtk/CursorThemeSize ' "$_xs" || echo 'Gtk/CursorThemeSize 24' >> "$_xs"

sed -i "$_xs" \
    -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|" \
    -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|" \
    -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|" \
    -e "s|^Xft/DPI .*|Xft/DPI $((RICE_DPI * 1024))|" \
    -e "s|^Gtk/CursorThemeSize .*|Gtk/CursorThemeSize ${_cursor:-24}|"
unset _xs _cursor

sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/" "$HOME"/.icons/default/index.theme

# Reload daemon and apply gtk theme
if pidof -q xsettingsd; then
    pkill -1 xsettingsd
fi
xsetroot -cursor_name left_ptr
