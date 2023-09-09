set -a fish_user_paths ~/.local/lib/npm/bin
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config

#for the time being, I've added export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config to my bashrc, which allowed me to move 
# ~/.npmrc to $XDG_CONFIG_HOME/npm/config.
#And in my npm config, I added cache=${XDG_CACHE_HOME}/npm so I was able to remove ~/.npm (and it now stores the npm cache under $XDG_CACHE_HOME/npm)
