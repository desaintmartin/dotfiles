if [ -f "/usr/share/zsh-antigen/antigen.zsh" ]; then;
  source /usr/share/zsh-antigen/antigen.zsh
else
  source /usr/local/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh
#antigen theme https://github.com/iam4x/zsh-iterm-touchbar
antigen bundles <<EOBUNDLES
    common-aliases
    history
    osx
    compleat
    screen
    ssh-agent
    textmate
    brew
    pip
    python
    docker
    kubectl
    helm
    autojump

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES
antigen theme dieter
antigen apply

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTSIZE=1000000         # Increases size of history
export SAVEHIST=1000000

# Non-standard paths :
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/usr/local/opt/curl/bin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.gem/ruby/1.8/bin:$PATH
export PATH=/Applications/FirefoxNightly.app/Contents/MacOS:$PATH
export PATH=/Users/cedricdesaintmartin/.cargo/bin:$PATH
export PATH=/usr/local/Cellar/telepresence/0.100/libexec:$PATH

# node.js
export NODE_PATH=/usr/local/lib/node:/usr/local/share/npm/lib/node_modules/

# SSL
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Go
#export GOPATH=$HOME/go

# git alias
alias git-gui="/usr/local/git/share/git-gui/lib/Git\ Gui.app/Contents/MacOS/Wish"
alias ga="git commit --amend -a -C HEAD"
alias gr="git rebase -i origin/master"
alias gd='export BRANCH=master; \
  git rev-parse --verify main > /dev/null && export BRANCH=main; \
  git checkout $BRANCH && git fetch origin --prune && git branch | grep -v $BRANCH | xargs git branch -D && git reset --hard origin/$BRANCH'
alias gdu='export BRANCH=master; \
  git rev-parse --verify main > /dev/null && export BRANCH=main; \
  git checkout master && git fetch upstream --prune && git branch | grep -v master | xargs git branch -D && git reset --hard upstream/master'

# pyenv
eval "$(pyenv init -)"
export PATH="$HOME/.pyenv/shims:$PATH"

# python venv
function jv() {
  j $1
  if [[ -n "$VIRTUAL_ENV" ]] ; then
    deactivate
  fi
  if [[ -d ./.venv ]] ; then
    . ./.venv/bin/activate
  fi
  if [[ -d ./venv ]] ; then
    . ./venv/bin/activate
  fi
}

# various
alias publickey="cat ~/.ssh/id_rsa.pub | pbcopy"
function killfrom {
  if [[ $# -eq 0 ]] ; then
      echo 'No parameter'
      return
  fi
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}
function fullps {
perl -e '$p=shift;open MAPS, "/proc/$p/maps";
          ($m)=grep /\[stack\]/, <MAPS>;
          ($a,$b)=map hex, $m =~ /[\da-f]+/g;
          open MEM, "/proc/$p/mem";
          seek MEM,$a,0; read MEM, $c,$b-$a;
          print((split /\0{2,}/,$c)[-1])' "$1" | tr \\0 \\n | head
}

# thefuck
# eval $(thefuck --alias)

# iTerm2
source ~/dotfiles/iterm2_shell_integration.zsh

autoload -U +X bashcompinit && bashcompinit

# mayo
if [ -n "$MAYO_PS1" ]; then
	PROMPT_COMMAND="mayo() { if [[ \"\$#\" == \"1\" && \"\$1\" == \"port-forward-stop\" ]]; then command mayo port-forward-stop && exit ;  else command mayo \"\$@\" ; fi;}"
        PS1="$MAYO_PS1"
	FOO=${MAYO_MPPID:=$(echo $$)}; export MAYO_MPPID
	echo "$MAYO_WELCOME_MESSAGE"
fi
export PS1
export SHELL

. ~/mayo-complete.sh

alias mayo="/Users/cedricdesaintmartin/Desktop/Wiremind/devops/mayo/.venv/bin/mayo"

PATH=$PATH:/Users/cedricdesaintmartin/Desktop/Wiremind/devops/cluster-manager/.venv/bin
alias ls=lsd

# Google Cloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
