# set up XDG folders

# XDG_DATA_HOME
if not set -q XDG_DATA_HOME
    set -gx XDG_DATA_HOME "$HOME/.local/share"
end

# XDG_CONFIG_HOME
if not set -q XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end

# XDG_STATE_HOME
if not set -q XDG_STATE_HOME
    set -gx XDG_STATE_HOME "$HOME/.local/state"
end

# XDG_CACHE_HOME
if not set -q XDG_CACHE_HOME
    set -gx XDG_CACHE_HOME "$HOME/.cache"
end