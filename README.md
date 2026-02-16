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

| Package    | What it manages                        | Category |
|------------|----------------------------------------|----------|
| `home`     | `~/.zshenv`, `~/.profile`, `.editorconfig` | base |
| `zsh`      | Zsh config, plugins list (Antidote)    | base     |
| `starship` | Starship prompt                        | base     |
| `git`      | Git config and global ignore           | base     |
| `nvim`     | Neovim (LazyVim)                       | base     |
| `lsd`      | LSDeluxe file listing                  | base     |
| `qtile`    | Qtile window manager                   | desktop  |
| `wezterm`  | Wezterm terminal                       | desktop  |
| `rofi`     | Rofi launcher                          | desktop  |
| `dunst`    | Dunst notifications                    | desktop  |
| `scripts`  | Machine-specific scripts (`~/bin/`)    | machine  |

### Headless machine example

```toml
# .dotter/local.toml
packages = ["helpers", "home", "zsh", "starship", "git", "nvim", "lsd"]
```

## Adding a new tool

1. Create a directory at the repo root (e.g. `tmux/`)
2. Add its config files inside
3. Add a `[tmux.files]` section to `.dotter/global.toml`
4. Add `"tmux"` to your `local.toml` packages list
5. Run `dotter deploy`

## Theme

Catppuccin Macchiato across all tools. The full palette is available as default variables in `global.toml` for any config that uses handlebars templating.
