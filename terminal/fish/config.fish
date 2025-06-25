# source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR nvim
set -gx VISUAL code

function reload --description 'Reload Fish'
    ctrem "[green]Reloading Fish  󰼂 󰼂 󰼂 󰼂 [/green]"
    source ~/.config/fish/config.fish
end

bass source /etc/profile
starship init fish | source

export NAVI_FZF_OVERRIDES='--height 15'
export NAVI_FZF_OVERRIDES_VAR='--height 15'

# Use Alt-S for <TAB> search, conflict solve for zellyj
bind --preset alt-s pager-toggle-search
