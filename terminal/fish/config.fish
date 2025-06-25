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

# Use Ctrl-y for <TAB> search, conflict solve for zellyj
bind ctrl-y pager-toggle-search

if status --is-interactive
    keychain --quiet id_ed25519
end

begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
end
