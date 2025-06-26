# source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR nvim
set -gx VISUAL code

function reload --description 'Reload Fish'
    ctrem "[green]Reloading Fish  󰼂 󰼂 󰼂 󰼂 [/green]"
    source ~/.config/fish/config.fish
end

starship init fish | source

export NAVI_FZF_OVERRIDES='--height 15'
export NAVI_FZF_OVERRIDES_VAR='--height 15'
export SYSTEMD_LESS="FRSMK --mouse --wheel-lines=3"
export SYSTEMD_PAGER="bat"

# Use Ctrl-y for <TAB> search, conflict solve for zellyj
bind ctrl-y pager-toggle-search

set -gx TERMINAL_PROG (terminal-type)
# ctrem "On terminal [green]'$TERMINAL_PROG'[/] agent [green]'$SSH_AGENT_PID'[/] "$SSH_AUTH_SOCK""
