function terminal-type --description 'get terminal type'
    set -l terminal_type

    if test "$TERMINAL_EMULATOR" = JetBrains-JediTerm
        set terminal_type JetBrains
    else if set -q WEZTERM_EXECUTABLE
        set terminal_type wezterm
    else if set -q GNOME_TERMINAL_SERVICE
        set terminal_type gnome
    else if set -q ALACRITTY_WINDOW_ID
        if test "$ALACRITTY_WINDOW_ID" = 0
            set terminal_type cosmic
        else
            set terminal_type alacritty
        end
    else if set -q INSIDE_NAUTILUS_PYTHON
        set terminal_type nautilus
    else
        set terminal_type xterm
    end

    echo "$terminal_type"
end
