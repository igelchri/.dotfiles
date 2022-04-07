#----- Exports
export LANG=de_DE.UTF-8
export EDITOR='micro'
export VISUAL='geany'

#export LC_ALL="de_DE.UTF-8"

#--- PATH
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.locaL/bin:$PATH"
#export PATH="$HOME/.config/bspwm/scripts:$PATH"
#export PATH="$HOME/.config/bspwm/bin:$PATH"
#export PATH="$HOME/.config/bspwm/rofi/bin:$PATH"
#export PATH="$HOME/.emacs.d/bin:$PATH"


# Path to your oh-my-zsh installation.
#installation via script from github
export ZSH=$HOME/.oh-my-zsh
#installation via paru -S oh-my-zsh-git
#export ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# if you installed the package oh-my-zsh-powerline-theme-git then you type here "powerline" as zsh theme
#ZSH_THEME="simple"
#ZSH_THEME="agnoster"
#ZSH_THEME="fletcherm"
#ZSH_THEME="mikeh"
#ZSH_THEME="clean"
#ZSH_THEME="maran"
#ZSH_THEME="bureau"
#ZSH_THEME="gentoo"
#ZSH_THEME="frontcube"
#ZSH_THEME="tjkirch"
#ZSH_THEME="pmcgee"
ZSH_THEME="spaceship"


#ZSH_THEME="random"

ZSH_THEME_RANDOM_CANDIDATES=( "simple" "agnoster" "fletcherm" "mikeh" "clean" "maran" "bureau" "gentoo" "frontcube" "tjkirch" "pmcgee")

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd


#PS1='[\u@\h \W]\$ '

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

#elfman
#sfetch
