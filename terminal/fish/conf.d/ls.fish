# Replace ls with eza
set -gx LS_COLORS "$(vivid generate nord)"
alias ls='eza  --color=always --group-directories-first --icons --color-scale --hyperlink'
alias la='eza -a --color=always --group-directories-first --icons --color-scale --hyperlink'
alias ll='eza -l --color=always --group-directories-first --icons --color-scale --hyperlink'
alias lt='eza -aT --color=always --group-directories-first --icons --color-scale --hyperlink'
alias tree='eza --tree --level=2 --long --icons --git --hyperlink'
alias l.="eza -a --icons  | grep -e '^\.'" # show only dotfiles
