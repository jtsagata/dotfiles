# Create symlinks from ~/.dotfiles
symlinks: 
    rotz link -l symbolic

# Force create symlinks (danger Will Robinson)
force: 
    rotz link -l symbolic --force

# Upate keybindings file
bind:
    /usr/bin/fish -i -c  'bind -k > data/keybindings.txt'
