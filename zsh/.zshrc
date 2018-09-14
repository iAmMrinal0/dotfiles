# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mod_steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux extract git sudo)

# User configuration

  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:$HOME/bin:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='emacsclient'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dac="deactivate"

# Virtualenvwrapper config
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TERM=xterm-256color

alias hdmii="xrandr --output LVDS1 --off --output HDMI1 --mode 1920x1080i; feh --bg-center ~/Pictures/space.jpg"
alias hdmio="xrandr --output LVDS1 --auto --output HDMI1 --off"
alias vgai="xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --output VGA1 --mode 1280x1024 --pos 1366x0; feh --bg-center ~/Pictures/space.jpg"
alias vgao="xrandr --output LVDS1 --auto --output VGA1 --off"

alias gkhdi="xrandr --output VGA-1 --mode 1280x720; feh --bg-center ~/Pictures/space.jpg; date +'%H:%M:%S'"
alias gkhdo="xrandr --output LVDS-1 --auto --output VGA-1 --off; date +'%H:%M:%S'"

alias kmp="killall mpd pulseaudio;pactl set-sink-volume 0 45%"

alias ag="ag"
alias e="emacsclient -a '' -c"

alias clone='f () { git clone git@github.com:"$1"/"$2" ; }; f'
alias cow='f () { cower -df $1 && cd $1; makepkg -sri; cd - ; }; f'

alias prepl="pulp repl"
alias pbld="pulp build"
alias prun="pulp run"
alias pwb="pulp --watch build"
alias pcb="rm -rf output && pulp build"
alias pcwb="rm -rf output && pulp --watch build"
alias pwlb="pulp --watch --before clear build"

set -o ignoreeof

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
