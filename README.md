# dotfiles

Managed with [dotter](https://github.com/SuperCuber/dotter). Each tool is its own package, toggled per-machine.

## Setup on a new machine

```sh
# Install dotter
cargo install dotter

# Clone
git clone <repo-url> ~/projects/dotfiles
cd ~/projects/dotfiles

# Configure for this machine
cp .dotter/local.toml.example .dotter/local.toml
# Edit local.toml: choose packages, set hostname

# Preview what will be linked
dotter deploy --dry-run

# Deploy
dotter deploy
```

## Packages

| Package         | What it manages                            | Category |
| --------------- | ------------------------------------------ | -------- |
| `home`          | `~/.zshenv`, `~/.profile`, `.editorconfig` | base     |
| `zsh`           | Zsh config, plugins list (Antidote)        | base     |
| `starship`      | Starship prompt                            | base     |
| `git`           | Git config and global ignore               | base     |
| `nvim`          | Neovim (LazyVim)                           | base     |
| `lsd`           | LSDeluxe file listing                      | base     |
| `systemd`       | systemd user units                         | base     |
| `i3`            | i3 window manager + betterlockscreen       | desktop  |
| `wezterm`       | Wezterm terminal                           | desktop  |
| `rofi`          | Rofi launcher                              | desktop  |
| `dunst`         | Dunst notifications                        | desktop  |
| `polybar`       | Polybar status bar                         | desktop  |
| `gtk-4`         | GTK4 settings                              | desktop  |
| `xdg`           | XDG user dirs, MIME associations           | desktop  |
| `scripts`       | Machine-specific scripts (`bin/`)          | machine  |
| `betterdiscord` | BetterDiscord themes/plugins               | app      |
| `bruno`         | Bruno API client preferences               | app      |
| `opencode`      | Opencode CLI config, MCP servers, skills   | app      |
| `wakatime`      | WakaTime CLI config                        | app      |
| `just`          | `just` command runner config               | app      |
| `glances`       | Glances system monitor config              | app      |
| `ue5`           | Unreal Engine 5 desktop entry              | app      |

`grafana/gcx/config.yaml` is not a dotter package — `gcx` manages its own OAuth token refresh, so it isn't templated/synced. Run `gcx login` per machine; `grafana/gcx/config.yaml.example` documents the shape.

### Headless machine example

```toml
# .dotter/local.toml
packages = ["home", "zsh", "starship", "git", "nvim", "lsd"]
```

## Adding a new tool

1. Create a directory at the repo root (e.g. `tmux/`)
2. Add its config files inside
3. Add a `[tmux.files]` section to `.dotter/global.toml`
4. Add `"tmux"` to your `local.toml` packages list
5. Run `dotter deploy`

## Theme

Catppuccin Macchiato across all tools. The full palette is available as default variables in `global.toml` for any config that uses handlebars templating.
