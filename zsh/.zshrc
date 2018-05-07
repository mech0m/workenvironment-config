# The following lines were added by compinstall
zstyle :compinstall filename '/home/malte/.zshrc'


autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install


source ~/.config/workenvironment-config/zsh/agkozak-zsh-theme/agkozak-zsh-theme.plugin.zsh
source ~/.config/workenvironment-config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_THEME=agkozak
export KEYTIMEOUT=1

#aliases
alias ll="ls -l --group-directories-first"
alias ls="ls -h --color"    # add colors for filetype recognition
alias la="ls -A"            # show hidden files
alias lx="ls -xb"           # sort by extension
alias lc="ls -ltcr"         # sort by and show change time, most recent last
alias lu="ls -ltur"         # sort by and show access time, most recent last
alias lt="ls -ltr"          # sort by date, most recent last
alias lm="ls -Al | less -r"     # pipe through 'more'

######## Pacman ########
# update 
alias pacup="sudo pacman -Syu"

# Remove orphans
alias orphans="pacman -Qtdq"

