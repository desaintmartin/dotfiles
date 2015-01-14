# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="dieter"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(cp git history osx compleate pip screen ssh-agent textmate brew python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export HISTSIZE=100000         # Increases size of history
export SAVEHIST=100000

export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=0'           # Normal text
LS_COLORS=$LS_COLORS:'fi=0'           # Regular file
LS_COLORS=$LS_COLORS:'di=36'          # Directory
LS_COLORS=$LS_COLORS:'ln=01;36'       # Symbolic link
LS_COLORS=$LS_COLORS:'pi=33'          # Named pipe
LS_COLORS=$LS_COLORS:'so=01;35'       # Socket
LS_COLORS=$LS_COLORS:'do=01;35'       # DO
LS_COLORS=$LS_COLORS:'bd=01;37'       # Block device
LS_COLORS=$LS_COLORS:'cd=01;37'       # Character device
LS_COLORS=$LS_COLORS:'ex=35'          # Executable file
LS_COLORS=$LS_COLORS:'*FAQ=31;7'      # FAQs
LS_COLORS=$LS_COLORS:'*README=31;7'   # READMEs
LS_COLORS=$LS_COLORS:'*INSTALL=31;7'  # INSTALLs
LS_COLORS=$LS_COLORS:'*.sh=47;31'     # Shell-Scripts
LS_COLORS=$LS_COLORS:'*.vim=35'       # Vim-"Scripts"
LS_COLORS=$LS_COLORS:'*.swp=00;44;37' # Swapfiles (Vim)
LS_COLORS=$LS_COLORS:'*.sl=30;33'     # Slang-Scripts
LS_COLORS=$LS_COLORS:'*,v=5;34;93'    # Versioncontrols
LS_COLORS=$LS_COLORS:'or=01;05;31'    # Orphaned link
LS_COLORS=$LS_COLORS:'*.c=33'         # Sources
LS_COLORS=$LS_COLORS:'*.C=33'         # Sources
LS_COLORS=$LS_COLORS:'*.h=33'         # Sources
LS_COLORS=$LS_COLORS:'*.cc=33'        # Sources
LS_COLORS=$LS_COLORS:'*.py=33'        # Sources
LS_COLORS=$LS_COLORS:'*.rb=33'        # Sources
LS_COLORS=$LS_COLORS:'*.awk=33'       # Sources
LS_COLORS=$LS_COLORS:'*.pl=33'        # Sources
LS_COLORS=$LS_COLORS:'*.jpg=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.JPG=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.gif=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.png=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.ppm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pgm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pbm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.tar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.tgz=31'       # Archive
LS_COLORS=$LS_COLORS:'*.gz=31'        # Archive
LS_COLORS=$LS_COLORS:'*.zip=31'       # Archive
LS_COLORS=$LS_COLORS:'*.sit=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lha=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lzh=31'       # Archive
LS_COLORS=$LS_COLORS:'*.rar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.arj=31'       # Archive
LS_COLORS=$LS_COLORS:'*.bz2=31'       # Archive
LS_COLORS=$LS_COLORS:'*.avi=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpg=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpeg=35'      # Video
LS_COLORS=$LS_COLORS:'*.divx=35'      # Video
LS_COLORS=$LS_COLORS:'*.xvid=35'      # Video
LS_COLORS=$LS_COLORS:'*.mov=35'       # Video
LS_COLORS=$LS_COLORS:'*.mp4=35'       # Video
LS_COLORS=$LS_COLORS:'*.m4v=35'       # Video
LS_COLORS=$LS_COLORS:'*.wmv=35'       # VIdeo
LS_COLORS=$LS_COLORS:'*.mp3=37'       # Audio
LS_COLORS=$LS_COLORS:'*.ogg=37'       # Audio
LS_COLORS=$LS_COLORS:'*.wav=37'       # Audio
LS_COLORS=$LS_COLORS:'*.au=37'        # Audio
LS_COLORS=$LS_COLORS:'*.html=36'      # HTML
LS_COLORS=$LS_COLORS:'*.htm=1;34'     # HTML
LS_COLORS=$LS_COLORS:'*.php=1;45'     # PHP
LS_COLORS=$LS_COLORS:'*.doc=1;34'     # MS-Word
LS_COLORS=$LS_COLORS:'*.txt=1;34'     # Plain/Text
LS_COLORS=$LS_COLORS:'*.o=1;36'       # Object-Files
LS_COLORS=$LS_COLORS:'*.a=1;36'       # Shared-libs
export LS_COLORS

# Non-standard paths :
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.gem/ruby/1.8/bin:$PATH
export PATH=/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin:$PATH
export PATH=/Applications/FirefoxNightly.app/Contents/MacOS:$PATH

export NODE_PATH=/usr/local/lib/node:/usr/local/share/npm/lib/node_modules/

# ls aliases
alias l='ls'
alias ll='ls -l'
alias la='ls -A'

#git-gui alias
alias git-gui="/usr/local/git/share/git-gui/lib/Git\ Gui.app/Contents/MacOS/Wish"

# Message d'accueil :
echo "Welcome, WaterCooled. It's not a bug, it's a feature."

alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

# macvim
MACVIM=/Applications/MacVim.app
if [ -d $MACVIM ]; then
  alias vim='$MACVIM/Contents/MacOS/Vim'
fi

#pyenv
eval "$(pyenv init -)"
#source ~/.pyenv/completions/pyenv.zsh

# SlapOS
alias buildout-bootstrap="curl 'http://downloads.buildout.org/1/bootstrap.py' | python -S -"
alias buildout-bootstrap2="curl 'http://downloads.buildout.org/2/bootstrap.py' | python -S -"
export MAKEFLAGS=-j4
export MACOSX_DEPLOYMENT_TARGET=10.9

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# various
alias publickey="cat ~/.ssh/id_rsa_passphrase.pub | pbcopy"
alias git-auto-fixup="git add \* && git commit --fixup=HEAD && git rebase -i --autosquash HEAD~2"
function killfrom {
  if [[ $# -eq 0 ]] ; then
      echo 'No parameter'
      return
  fi
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

fortune | ponysay
