# ArchDotfiles — hcx05's BSPWM Environment
<div align = center>

![bspwm-dotfiles](https://github.com/gh0stzk/dotfiles/assets/67278339/0340846a-74d4-4a43-9430-142b0832738d)




&ensp;[<kbd> <br> Install <br> </kbd>](#-installation)&ensp;
&ensp;[<kbd> <br> Features <br> </kbd>](#-features)&ensp;
&ensp;[<kbd> <br> Themes <br> </kbd>](#-the-themes)&ensp;
&ensp;[<kbd> <br> Keybindings <br> </kbd>](#very-useful-keybindigs-to-know)&ensp;
&ensp;[<kbd> <br> Wiki <br> </kbd>](https://github.com/gh0stzk/dotfiles/wiki)&ensp;
<br><br><br></div>

https://github.com/user-attachments/assets/3eaae1e2-04dc-4a9b-8c91-139f85f5fb9e

<br>

## 👻 Welcome

Welcome to my dotfiles. This repo is a personal fork of [gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles) (GPL-3.0), customized by [hcx05](https://github.com/hcx05) for daily use on Arch Linux: Traditional Chinese input, a transparent tmux status bar, a trimmed Neovim setup, a pentest toolkit and a handful of keybinding changes. All the credit for the base rice (themes, bars, applets, RiceEditor, ...) goes to gh0stzk.

These dotfiles are designed with the goal of providing a bspwm environment that is lightweight, efficient, and functional, tailored for any use—whether it’s gaming, web browsing, or a productive work setting.

You’ll have 18 unique themes to choose from, each with its own style, colors, and navigation bar options. With this variety, you’re sure to find one that suits your preferences and needs.

## 🔧 What's different in this fork

| Area | Change |
| :--- | :--- |
| Input method | `ibus` + `ibus-chewing` (Zhuyin). `Super + i` or a lone tap on **Right Shift** (via `xcape`) toggles English ⇄ Chewing, see `config/bspwm/bin/toggle-ibus.sh` |
| Clipboard | `Super + v` opens a clipboard-history picker (`config/rice/clipboard`), pick an entry to paste it into the window |
| Windows | `Super + Shift + M` (`ToggleMax`) fills the work area of a floating window (bars stay visible) and restores it on the second press. `Super + Ctrl + arrows/hjkl` resizes, falling back to the opposite edge at screen borders |
| Keybindings | Close = `Super + Shift + Q`, launcher = `Super + d`, layout is Vim-friendly. See [Keybindings](#very-useful-keybindigs-to-know) |
| Tmux | Transparent status bar with sky-blue text, live system stats. See [Tmux Setup](#tmux-setup) |
| Neovim | Own lightweight setup (catppuccin, telescope, nvim-tree, nvim-cmp, Copilot, Python/C/C++ run key). See [Neovim Setup](#neovim-setup) |
| Zsh | Extra aliases and key bindings, see [Zsh](#optimized-zsh-configuration) |
| Fastfetch | Arch logo config in `config/fastfetch` |
| Pentest | `misc/pentest`: tool list + `install-pentest-tools.sh` |
| Installer | `RiceInstaller` clones **this** repo, installs tmux/tpm, ibus, xcape and fixes permissions of the helper scripts |

## :book: Wiki
These are the upstream docs (they describe the original rice, some keybindings differ in this fork — the table below is the source of truth). Start with the upstream [**Wiki**](https://github.com/gh0stzk/dotfiles/wiki). If it is your first time with a WM, you may be interested in reading [First steps after installing the dotfiles](https://github.com/gh0stzk/dotfiles/wiki/Firsts-steps-after-installing) or maybe read [frequently asked questions and answers](https://github.com/gh0stzk/dotfiles/wiki/Questions---Answers) [Keybinds](https://github.com/gh0stzk/dotfiles/wiki/Keyboard-Shortcuts) [Firefox Theme](https://github.com/gh0stzk/dotfiles/wiki/Firefox-Theme).

## 🚀 Features
<img src="https://user-images.githubusercontent.com/67278339/221605474-21d65156-0cf7-485c-bd1a-40792c37817e.png" alt="Linux Fetch" align="right" width="450">

#### Change themes on the fly

You can switch themes instantly, with no need to restart your session or environment. With just one click, the change is applied immediately.

#### Consistency Across the Environment

Unlike Matugen, Pywal, and other wallpaper-based theming tools, colors are not extracted from images. Every theme includes a handcrafted color palette, carefully selected to maintain consistency, readability, and visual appeal.

A modular theming system propagates these colors across the entire desktop environment. Switching themes instantly updates:

- BSPWM
- GTK (3.x)
- Dunst
- Rofi
- Terminals
  - Alacritty
  - Ghostty
  - Kitty
  - St
  - Xfce-terminal
- Neovim
- Eww
- Firefox
- Jgmenu
- Geany
- ScreenLocker (i3lock-color)
- Mpv Player
- Cava
- Zathura
- Polybar
- Cli-Tools
  - Yazi
  - Fzf-Tab
  - Bat
  - Eza
  - Ncmpcpp

Not all modules are enabled.

If you want to know how it works and how to enable or disable modules, go to [Color Modules](https://github.com/gh0stzk/dotfiles/wiki/Color-Modules)

ToDo-List:

- Obsidian
- Telegram-desktop
- Steam
- Btop
- Qt (5/6)
- Rmpc

#### Performance optimized

BSPWM is not a desktop environment (DE), and that’s exactly what makes it stand out in terms of lightweight performance. On my systems, my BSPWM-dotfiles environment starts with under **600 MB of RAM usage**. While these numbers don't tell the whole story, they do highlight the minimalist approach that a window manager should embrace.

In addition, each theme can be configured independently — either by manually editing the theme’s configuration file or using my RiceEditor application. This ensures a high level of customization: if you want a minimalist setup for a specific theme, you can disable animations, shadows, rounded borders, or fading effects. On the other hand, if you prefer a more visually rich theme with all those features enabled, that’s fully supported as well. My dotfiles are built to provide that level of flexibility.

#### Multi-Monitor support

If you have multiple monitors, BSPWM will automatically detect and configure up to 4 displays when launching with my dotfiles.

If you connect an additional monitor while the session is already running, simply reload BSPWM using the `Super + Alt + r` key combination, and your monitors will be configured instantly.

You can check the Wiki [👉 Monitors Setup](https://github.com/gh0stzk/dotfiles/wiki/Monitors-setup) if you want to edit the default layouts.

#### RiceEditor

Is an application designed to simplify the customization of your current theme. It allows you to easily adjust various visual and configuration aspects, tailoring your environment to your preferences without the need to manually edit configuration files.

#### Wallpaper Engines

My dotfiles support **5 different methods** for setting your favorite wallpaper:

1. **Random**: Sets a random wallpaper from the theme’s Walls directory.
2. **CustomDir**: Sets a random wallpaper from a directory you specify.
3. **Default**: Sets a specific image as wallpaper. (Default)
4. **CustomAnimated**: Supports animated wallpapers (.mp4, .mkv, .gif).
5. **Slideshow**: Changes the wallpaper every 15 minutes with a random image from the theme’s Walls directory.

Each option is **theme-specific**, meaning you can have an animated wallpaper in one theme, a static image in another, or a custom directory in a third — And all your settings will be preserved per theme. By default, all themes load a default wallpaper from their Walls Rice folder.

Check the wiki for more details: [👉 Wallpapers Configuration](https://github.com/gh0stzk/dotfiles/wiki/Wallpapers-Configuration)

#### Scratchpad

A _scratchpad_ is a tool designed to provide quick, temporary access to applications or notes without disrupting the desktop workflow. When activated, the scratchpad appears over the current workspace, allowing the user to access applications like a terminal, text editor, or any configured tool. Minimizing it hides the scratchpad from view but keeps it running in the background, ready to be reopened with a simple keyboard shortcut.

It's ideal for quick note-taking, running commands, or accessing auxiliary tools without losing focus on the current task.

#### Rofi Applets

Rofi applets to simplify your workflow:

- Wallpaper Selector - See the wiki [WallpaperSelector](https://github.com/gh0stzk/dotfiles/wiki/WallpaperSelector)
- Network Manager
- Bluetooth Controller
- Clipboard Manager
- Screenshot Tool
- Android MTP Manager
- Power Menu
- Keyboard Layout
- Terminal Selector (Alacritty, Kitty, ST and ghostty)
- Rofi app launcher style selector
- Tab app switcher
- Pass Manager (Using pass app)

#### Neovim Setup

Lightweight Lua config (`config/nvim`, plugin manager [lazy.nvim](https://github.com/folke/lazy.nvim), leader = `Space`):

- Colorscheme [catppuccin](https://github.com/catppuccin/nvim) + [transparent.nvim](https://github.com/xiyaowong/transparent.nvim)
- Treesitter and native LSP (`pyright`, ...)
- Completion [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + LuaSnip
- Fuzzy finder [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- File tree [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- Statusline [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Terminal [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- Dashboard [alpha-nvim](https://github.com/goolord/alpha-nvim), notifications [nvim-notify](https://github.com/rcarriga/nvim-notify), autopairs
- AI: [copilot.vim](https://github.com/github/copilot.vim) and [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)

| Keys | Action |
| :--: | :----- |
| `Space` + `r` | Save and build/run the file (C: `gcc`, C++: `g++`, Python: `python3`) in toggleterm |
| `Space` + `f` | Format a Python file with `ruff` |
| `Space` + `y` | Yank to the system clipboard (normal / visual) |
| `K` | Show diagnostics float |

#### Tmux Setup

Minimal but complete tmux configuration (`~/.tmux.conf` + `~/.tmux_status.sh`):

- Status bar at the bottom, refreshed every second: `user | CPU | RAM | LOAD | time | IP`
- **Mono theme**: transparent background and sky-blue text (`colour39`, `#00afff`). To recolor, change `colour39` in `~/.tmux.conf` and in the `mono` branch of `~/.tmux_status.sh`
- Non-mono themes get a powerline-style gradient bar
- The terminal style is read from `~/.config/rice/terminal-style` and `~/.config/rice/tmux-theme.conf`
- `tmux-256color` with true color, `escape-time 0`, `allow-passthrough on` (kitty graphics, e.g. fastfetch logo)
- Mouse on, vi copy-mode (`v` select, `y` copy through `xclip`, mouse drag copies and exits), `Prefix + ]` pastes from the system clipboard
- Pane navigation: `Prefix + h/j/k/l`
- Plugins via [tpm](https://github.com/tmux-plugins/tpm): `tmux-sensible`, `tmux-yank` (installed automatically by `RiceInstaller`; otherwise press `Prefix + I`)

#### Optimized ZSH Configuration

Optimized, native ZSH configuration. Not __Oh-My-Zsh__ or other bloated plugin managers. Some features:

- Fastest and optimized performance compinit function
- Autocompletion
- Syntax highlighting
- History substring search
- Fzf-tab completion with previews!!
- Aliases: `ls` / `ll` (eza with icons), `cat` (bat), `vim` (nvim), `music` (ncmpcpp), `update` (`paru -Syu`), `mirrors` (reflector), `grub-update`
- `Ctrl + ←/→` word jump, `Home`/`End`/`Delete`, `↑/↓` history substring search
- `EDITOR=geany`, `BROWSER=firefox`, `FILEMANAGER=thunar`

---

### 🎨 Launchers

| :tshirt: Theme Selector |
|:-:|
|![Screenshot-11_12_2023-01-06-03](https://github.com/gh0stzk/dotfiles/assets/67278339/b11b5c58-b9ec-446b-8980-4f77bebb3432)|

| :traffic_light: Wallpaper Selector |
|:-:|
|![Shot-2024-11-08-134530](https://github.com/user-attachments/assets/dbac8c47-f12c-4242-97d6-38ad1193f76b)|

| :tshirt: Bar Selector |
|:-:|
|![Bspwm Bar Selector](https://github.com/user-attachments/assets/94c4d699-890c-47d4-85dc-8e9622f4c679)|

### 🎨 The themes

| Emilia |
|:-:|
|<img src="https://user-images.githubusercontent.com/67278339/280174054-8f56d12d-4efa-4024-99e1-4679591b45ca.gif" alt="Emilia Rice" align="center">|

| Jan |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/6e4959b7-6d07-42c6-8ede-2f3c16094ad2" alt="Jan Rice" align="center"> |

| Aline |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5ae48d8d-ebcb-4fd5-9c80-78fc325a7a38" alt="Aline Rice" align="center"> |

| Andrea |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/1bfd302f-0e3f-4973-975b-56c78d6140ee" alt="Andrea Rice" align="center"> |

| Cynthia |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5df45139-1d73-4f5f-8e8d-a417c86bfb96" alt="Cynthia Rice" align="center"> |

| Isabel |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f2a0002f-3370-4361-9301-08abadcad600" alt="Isabel Rice" align="center"> |


| Silvia |
|:-:|
|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/616c2d93-fabf-41c2-9ab8-9c7b4d6a2e35" alt="Silvia Rice" align="center">|

| Melissa |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/a63e250d-c5d1-4360-afd7-cf64bf55a0fc" alt="Melissa Rice" align="center"> |

| Pamela |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f9e85839-53c9-4e15-a800-8a2f7ca40691" alt="Pamela Rice" align="center"> |

| Cristina |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/e14c6777-25f6-4621-a88b-4fda71dbcc7f" alt="Cristina Rice" align="center"> |

| Karla |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5455afdf-cc2f-4a8c-8fcd-526c59066d50" alt="Karla Rice" align="center"> |

| z0mbi3 |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/ff65caa8-6a15-4873-bf05-edf89ac0985d" alt="z0mbi3 Rice" align="center"> |

| Brenda |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/22e37944-5aad-46bf-8934-3a57d1718ed2" alt="Brenda Rice" align="center"> |

| Daniela |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f296d6b4-9c8a-49ae-bf63-d82e5105f122" alt="Daniela Rice" align="center"> |

| Marisol |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/d11d20c5-1edc-44c8-901b-a4103a139617" alt="Daniela Rice" align="center"> |

| h4ck3r |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/2d55fcc6-1ea4-4d56-8c46-3a3fe10566fe" alt="Hacker Rice" align="center"> |

| Varinka |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/454d82b4-8f09-4768-bf51-6ce7818ad226" alt="Varinka Rice" align="center"> |

| Yael |
|:-:|
| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/cbb0a1cc-4e2d-46a2-a4f2-ee0be3d08b50" alt="Yael Rice" align="center"> |

---

### Rofi applets

| ![Shot-2024-11-09-131850](https://github.com/user-attachments/assets/05107f74-e137-41c0-9132-31d9c4fa0bb4) | ![Shot-2024-11-09-131918](https://github.com/user-attachments/assets/c5680b39-9aba-41e5-a781-7f23f7f8e336) |
| :--------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|                                                 Power Menu                                                 |                                                Screenshoter                                                |

| ![Shot-2024-11-09-132031](https://github.com/user-attachments/assets/0893b0b6-1211-43cb-9923-f4e42af70f4b) | ![Shot-2024-11-09-133244](https://github.com/user-attachments/assets/03546cb9-cf0d-42a2-b424-458c887e67c2) |
| :--------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|                                              Keyboard Layout                                               |                                               Android Mount                                                |

| ![Shot-2024-11-09-150142](https://github.com/user-attachments/assets/f7d1c404-c2e8-43c0-ad5e-6b052e3918c3) | ![Shot-2024-11-09-155335](https://github.com/user-attachments/assets/889d2ccf-beff-402d-8804-6d82c5638860) |
| :--------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|                                              Network Manager                                               |                                             Clipboard Manager                                              |

| ![Shot-2024-11-09-153419](https://github.com/user-attachments/assets/4af56dfa-f61f-4b45-8350-d064fe67663a) | ![Shot-2024-11-09-153444](https://github.com/user-attachments/assets/fbd09603-8e8f-4cbb-a685-83a69a6d4c35) |
| :--------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|                                             Bluetooth Manager                                              |                                              Terminal Manager                                              |

| ![Shot-2025-04-08-084756](https://github.com/user-attachments/assets/835366c8-88c5-4daf-8260-5c822e27abc8) | ![Shot-2025-04-08-084924](https://github.com/user-attachments/assets/c32f3cdb-7a5a-4372-b6f2-3f4a09f50868) |
| :--------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------: |
|                                              Tab app switcher                                              |                                              Rofi style selector                                           |

| ![Shot-2025-04-08-084756](https://github.com/user-attachments/assets/59a84a0d-b471-444a-b4f9-091d4a0e51e2) |
| :--------------------------------------------------------------------------------------------------------: |
|                                              Rofi password manager                                         |

---

### Rofi app launcher styles
| ![Shot-2025-04-08-090012](https://github.com/user-attachments/assets/57ebcc98-73ea-4f76-bb2b-fe3f187be5e7) | ![Shot-2025-04-08-090041](https://github.com/user-attachments/assets/26361cd3-c3b4-48a2-a550-8df5cff120f5) | ![Shot-2025-04-08-090107](https://github.com/user-attachments/assets/16da6b0f-5a9e-4410-bb95-cb9fe696ce55) |
| :---: | :---: | :---: |
| Normal | Full | Minimal |

### Fzf tab terminal completions with previews!

| ![fzf tab](https://github.com/user-attachments/assets/2771e549-f7cc-44da-baf2-6c9fa299f0fb) |
| :---: |
| cd, ls, pacman, systemctl, kill, cat, commands with preview! |

### Eww widgets

| ![ProfilePane](https://github.com/user-attachments/assets/07827cff-63b9-40db-b0ef-8c214a5d8ec3) | ![MusicPlayer](https://github.com/user-attachments/assets/b96c49a1-57d1-43e5-bff0-cab2e6b4d101) |
| :---: | :---: |
| Profile Panel | Music Player |

---

### Rice Editor

| ![Shot-2024-11-09-155549](https://github.com/user-attachments/assets/2ac910c8-171f-47eb-8210-1469b6f75cc2) |
| :--------------------------------------------------------------------------------------------------------: |
|                                                Rice Editor                                                 |

### Lockscreen

| ![Lockscreen](https://github.com/user-attachments/assets/2f09b915-f426-49c3-b9b6-07be4e781f5a) |
| :--------------------------------------------------------------------------------------------: |
|                                           Lockscreen                                           |

### Jgmenu

| ![Jgmenu](https://github.com/user-attachments/assets/82daebec-66a6-4716-8e78-b02fcec7e77c) |
| :----------------------------------------------------------------------------------------: |
|                                           Jgmenu                                           |

## Yazi config

https://github.com/user-attachments/assets/8e15cc1a-88b8-4a7e-a4de-e7da76021406

## Scratchpad

https://github.com/user-attachments/assets/79764678-c519-4a41-a333-2a862a6d10f8

## Environment

| ![Gtk-Ranger-Music](https://github.com/user-attachments/assets/a7f7c082-5ffd-4a6c-babf-7361764cec80) |
| :--------------------------------------------------------------------------------------------------: |
|            The environment changes with each theme. In the gif: (Ranger, Thunar, Ncmpcpp)            |

### Firefox theme

| Firefox theme - z0mbi3 Fox |
|:-:|
| <img src="https://github.com/user-attachments/assets/877774da-1d27-4e9e-bd79-b084cf0c293e" alt="Firefox theme - z0mbi3-Fox" align="center"> |

### Neovim setup

| Neovim setup |
|:-:|
| ![Neovim setup](https://github.com/user-attachments/assets/deff5074-3d9b-4f00-8edd-82c83b6dccf4) |
| Plugins included [Neovim setup wiki](https://github.com/gh0stzk/dotfiles/wiki/Neovim-setup) |

## Very useful keybindigs to know...

`super` is the Windows key. Press `alt + F1` for the built-in cheatsheet, or read `config/bspwm/config/sxhkdrc`.

**Basics**

| Keys | Action |
| :--: | :----- |
| `super` + `Enter` | Terminal |
| `super` + `alt` + `Enter` | Floating terminal |
| `super` + `d` | App launcher |
| `alt` + `Tab` | Window switcher |
| `alt` + `space` | Theme selector |
| `super` + `alt` + `space` | Bar selector |
| `alt` + `F1` | Keybinds cheatsheet |
| `super` + `i` / tap `Right Shift` | Toggle input method (English ⇄ Chewing) |
| `super` + `v` | Clipboard history picker |

**Windows**

| Keys | Action |
| :--: | :----- |
| `super` + `shift` + `q` | Close window |
| `super` + `shift` + `x` | Kill window |
| `super` + `shift` + `t` / `a` / `f` | Tiled / Floating / Fullscreen |
| `super` + `shift` + `m` | Toggle maximize ⇄ restore (floating windows) |
| `super` + `shift` + `minus` or `alt` + `h` | Hide (minimize) window |
| `ctrl` + `alt` + `h` | Menu to restore hidden windows |
| `super` + `alt` + `←↓↑→` | Focus window in direction |
| `super` + `shift` + `←↓↑→` | Swap with window in direction |
| `super` + `ctrl` + `←↓↑→` or `h j k l` | Resize window (shrink/expand width and height) |
| `super` + `slash` | Rotate desktop 90° |
| `super` + `equal` | Balance (resize all windows equally) |
| `ctrl` + `shift` + `comma` / `period` | Focus last window / last desktop |

**Workspaces**

| Keys | Action |
| :--: | :----- |
| `super` + `1`…`9`, `0` | Go to workspace 1–10 |
| `super` + `←` / `→` | Previous / next workspace |
| `super` + `ctrl` + `1`…`9`, `0` | Send window to workspace |
| `ctrl` + `shift` + `←` / `→` | Send window to previous / next workspace and follow it |

**Apps**

| Keys | Action |
| :--: | :----- |
| `super` + `b` / `e` / `f` | Browser / Editor / File manager |
| `super` + `y` | Yazi |
| `super` + `shift` + `v` | Neovim |
| `super` + `m` | Ncmpcpp music player |
| `super` + `p` | Pavucontrol |
| `super` + `t` / `w` | Telegram / WhatsApp |
| `super` + `r` | RiceEditor |
| `super` + `alt` + `o` | Scratchpad |
| Right click on desktop | Jgmenu |

**Rofi applets** (`super` + `alt` + …)

| Keys | Action |
| :--: | :----- |
| `t` | Terminal selector |
| `w` | Wallpaper selector |
| `s` | Screenshot |
| `c` | Clipboard (clipcat) |
| `n` / `b` | Network manager / Bluetooth |
| `a` | Mount Android phone |
| `k` | Keyboard layout |
| `x` | Rofi pass |
| `l` | Rofi launcher style |
| `p` | Power menu |

**Session and bars**

| Keys | Action |
| :--: | :----- |
| `super` + `alt` + `r` | Restart bspwm |
| `super` + `Escape` | Reload sxhkd keybinds |
| `ctrl` + `super` + `alt` + `s` | Soft reload (daemons only) |
| `ctrl` + `super` + `alt` + `q` | Quit bspwm (log out) |
| `ctrl` + `super` + `alt` + `l` | Lock screen |
| `ctrl` + `super` + `alt` + `p` / `r` | Power off / Reboot |
| `super` + `alt` + `h` / `u` | Hide / unhide bar(s) |
| `ctrl` + `alt` + `plus` / `minus` / `t` | Window transparency more / less / reset |

Media keys (`XF86Audio*`, `XF86MonBrightness*`) control volume, player and brightness.

---

> [!CAUTION]
> ⚠️⚠️⚠️ My dotfiles are designed for a **1600x900** resolution with **96 DPI** on a single monitor.
> Some elements may appear different on higher or lower resolutions. You may need to make adjustments to adapt them to your preferences and setup. ⚠️⚠️⚠️

> [!important]
> ✏️✏️✏️ The installer assumes you already have a **functional** Arch Linux installation, whether it’s a fresh install or an existing setup.
>
> A login manager of your choice is required; **lightdm** is recommended.
>
> The rofi connection manager applet, works with **NetworkManager**
>
> If using a virtual machine, be sure to change the Picom backend from **glx** to **xrender** before rebooting, and verify that hardware acceleration is correctly configured in your VM. ✏️✏️✏️

> [!warning]
> :wrench::wrench::wrench: I have tested the installation and functionality of these dotfiles on both high- and low-end machines.
>
> Some adjustments may still be needed, such as changing the Picom backend or VSync settings to ensure compatibility with your graphics card.
>
> If you encounter any issues, feel free to open an [issue](https://github.com/hcx05/ArchDotfiles/issues). :wrench::wrench::wrench:

---

### 💾 Installation:

> [!NOTE]
> The installer only works for **ARCH** Linux, and based distros. (Except NO-Systemd ditros like Artix)

Before running this command, check [RiceInstaller](https://raw.githubusercontent.com/hcx05/ArchDotfiles/master/RiceInstaller) to make sure it's working and confirm it's safe for your system.

The installer must be run as a **normal user** (not root) from your `$HOME`. It will:

1. Add the `gh0stzk-dotfiles` and `chaotic-aur` pacman repositories (needs `sudo`)
2. Install the dependencies, including `tmux`, `xcape`, `ibus`, `ibus-chewing`, `neovim`, `zsh`, Nerd fonts, plus AUR packages through `paru`
3. Clone **this repo** (`hcx05/ArchDotfiles`) to `~/.local/share/gh0stzk`
4. Back up existing configs to `~/.RiceBackup/<date>` (bspwm, nvim, `.zshrc`, `.tmux.conf`, ...)
5. Copy configs to `~/.config`, `~/.local` and `$HOME`, make the helper scripts executable and install [tpm](https://github.com/tmux-plugins/tpm) with the tmux plugins
6. Enable the user MPD service and the ArchUpdates timer, switch your shell to `zsh`

You are asked whether you want the Neovim config and the Firefox theme.

- Open a terminal and execute these commands one by one:

```sh
# Download the installer in your $HOME
curl -LO https://raw.githubusercontent.com/hcx05/ArchDotfiles/master/RiceInstaller

# Give it execution permission
chmod +x RiceInstaller

# Run the installer
./RiceInstaller
```

Reboot when it finishes, then log in to **bspwm** from your login manager.

#### After installing

- Input method: run `ibus-setup` once and add **Chinese - Chewing** to the input methods, then use `super + i` to toggle.
- tmux: if the plugins are missing, start `tmux` and press `Prefix + I`.
- Pentest toolkit (optional): `bash ~/.local/share/gh0stzk/misc/pentest/install-pentest-tools.sh`, see [`misc/pentest/TOOLS.md`](misc/pentest/TOOLS.md).

#### Updating

To pull my latest changes: `git -C ~/.local/share/gh0stzk pull`, then copy the files you want over your config (or re-run the installer, it backs up first).

---

### Credits

- [gh0stzk](https://github.com/gh0stzk/dotfiles) — original rice, themes, applets and RiceEditor
- [justaguylinux](https://codeberg.org/justaguylinux/) — layouts script and cheatsheet
- [ilshatvm](https://github.com/ilshatvm) — BarSelector rofi design

License: [GPL-3.0](LICENSE)
