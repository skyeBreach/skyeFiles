<div align="center">
    <img src="./crates/resources/assets/icons/icon.svg" width="96" alt="RecceFinder">
    <h1>SkyeBreach's DotFiles</h1>
    <p>{{tagline}}</p>
    <a href="LICENSE">
        <img
            alt="Badge: License"
            src="https://img.shields.io/gitlab/license/breached-software%2Fclients%2Fseikurohiko%2Fversesignum%2Fversesignum"
        />
    </a>
</div>

Managed with [mise dotfiles](https://mise.jdx.dev/dotfiles.html). Each tool in `config/` is a dotfile group, picked
per machine.

## Setup on a new machine

```sh
# Clone and trust the repo's mise config
git clone <repo-url> ~/developer/projects/skyeFiles
cd ~/developer/projects/skyeFiles
mise trust

# Pick this machine's dotfile groups (or start from the other profile in tools/mise/machines/)
cp tools/mise/machines/arch-workstation.toml mise.local.toml

# Fill in the secrets that templates need
cp .env.local.example .env.local

# Preview, then deploy
mise run dotfiles:diff
mise run dotfiles:apply
```

Always go through the `dotfiles:*` tasks: they load `.env.local`, which a plain `mise dot apply` does not.

## Packages

| Group              | What it manages                                                   | Category |
| ------------------ | ----------------------------------------------------------------- | -------- |
| `environment`      | XDG dirs, default apps and tool paths (`~/.config/environment.d`) | base     |
| `home`             | `~/.zshenv`, `~/.profile`, `.editorconfig`                        | base     |
| `zsh`              | Zsh config, plugins list (Antidote)                               | base     |
| `starship`         | Starship prompt                                                   | base     |
| `git`              | Git config and global ignore                                      | base     |
| `nvim`             | Neovim (LazyVim)                                                  | base     |
| `lsd`              | LSDeluxe file listing                                             | base     |
| `systemd`          | systemd user units                                                | base     |
| `i3`               | i3 window manager                                                 | desktop  |
| `betterlockscreen` | Lock screen config and wallpapers                                 | desktop  |
| `wezterm`          | Wezterm terminal                                                  | desktop  |
| `rofi`             | Rofi launcher                                                     | desktop  |
| `dunst`            | Dunst notifications                                               | desktop  |
| `polybar`          | Polybar status bar                                                | desktop  |
| `gtk-4`            | GTK4 settings                                                     | desktop  |
| `xdg`              | XDG user dirs, MIME associations                                  | desktop  |
| `scripts`          | Machine-specific scripts (`config/bin/`)                          | machine  |
| `betterdiscord`    | BetterDiscord themes/plugins                                      | app      |
| `bruno`            | Bruno API client preferences                                      | app      |
| `opencode`         | Opencode CLI config, MCP servers, skills                          | app      |
| `wakatime`         | WakaTime CLI config                                               | app      |
| `just`             | `just` command runner config                                      | app      |
| `glances`          | Glances system monitor config                                     | app      |
| `gdb`              | GDB init with Unreal Engine pretty printers                       | app      |
| `wget`             | Wget config, keeps its HSTS file in the cache                     | app      |
| `ue5`              | Unreal Engine 5 desktop entry                                     | app      |
| `spotify`          | Spotify launch flags (`--disable-gpu`)                            | app      |
| `shiopa`           | Shiopa launcher script and desktop entry                          | app      |
| `apiark`           | ApiArk user config                                                | app      |
| `mise`             | Global mise config                                                | base     |
| `athame`           | Athame template sources                                           | app      |

`config/grafana/gcx/config.yaml` is not a dotfile group - `gcx` manages its own OAuth token refresh, so it isn't
templated/synced. Run `gcx login` per machine; `config/grafana/gcx/config.yaml.example` documents the shape.

### Machine profiles

`tools/mise/machines/` holds starting points for `mise.local.toml`: `arch-workstation.toml` (full desktop) and
`ubuntu-server.toml` (headless).

## Adding a new tool

1. Create a directory in `config/` (e.g. `config/tmux/`) and add its config files
2. Add a `[dotfile_groups.tmux]` table to the matching `.mise/conf.d/dotfiles-*.toml`
3. Add `"tmux"` to `dotfile_groups` in your `mise.local.toml`
4. Run `mise run dotfiles:apply`

## Theme

Catppuccin Macchiato across all tools.
