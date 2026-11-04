#!/bin/bash
# Give root the same shell/tmux/nvim setup as the invoking user.
# Usage: sudo bash root-setup.sh
set -e
U=$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6)
R=/root
install -m644 "$U/.zshrc" $R/.zshrc
install -m644 "$U/.tmux.conf" $R/.tmux.conf
install -m755 "$U/.tmux_status.sh" $R/.tmux_status.sh
mkdir -p $R/.config/zsh $R/.config/rice
install -m644 "$U/.config/rice/terminal-style" $R/.config/rice/terminal-style
install -m644 "$U/.config/rice/tmux-theme.conf" $R/.config/rice/tmux-theme.conf
for d in nvim fastfetch; do rm -rf "$R/.config/$d"; cp -r "$U/.config/$d" "$R/.config/$d"; done
rm -rf $R/.tmux; cp -r "$U/.tmux" $R/.tmux
chsh -s /usr/bin/zsh root
echo "root setup done"
