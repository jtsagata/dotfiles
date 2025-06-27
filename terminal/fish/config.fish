if not status is-interactive
    exit
end

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

fish_add_path --prepend ~/.local/bin

set -gx EDITOR nvim
set -gx VISUAL code

function reload
    set -l config (status -f)
    ctrem "[green]Reloading Fish  󰼂 󰼂 󰼂 󰼂 [/green] $config"
    exec fish
end

starship init fish | source

export NAVI_FZF_OVERRIDES='--height 15'
export NAVI_FZF_OVERRIDES_VAR='--height 15'
export SYSTEMD_LESS="FRSMK --mouse --wheel-lines=3"
export SYSTEMD_PAGER="bat"
export PAGER="bat"

# Use Ctrl-y for <TAB> search, conflict solve for zellyj
bind ctrl-y pager-toggle-search
bind up _atuin_bind_up
bind alt-n _navi_smart_replace

alias topnet="nethogs -b"
abbr --add usystem 'systemctl --user'
abbr --add ulogs 'journalctl --user'

set -gx TERMINAL_PROG (terminal-type)
# ctrem "On terminal [green]'$TERMINAL_PROG'[/] agent [green]'$SSH_AGENT_PID'[/] "$SSH_AUTH_SOCK""

if status is-interactive
    if test "$TERMINAL_PROG" = wezterm
        set ZELLIJ_AUTO_EXIT true
        eval (zellij setup --generate-auto-start fish | string collect)
    end
end
