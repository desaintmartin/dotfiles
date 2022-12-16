# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f "/usr/share/zsh-antigen/antigen.zsh" ]; then;
  source /usr/share/zsh-antigen/antigen.zsh
else
  source /usr/local/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh
#antigen theme https://github.com/iam4x/zsh-iterm-touchbar
antigen bundles <<EOBUNDLES
    autojump
    brew
    common-aliases
    compleat
    docker
    helm
    history
    iterm2
    kube-ps1
    kubectl
    macos
    pip
    python
    screen
    textmate

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme romkatv/powerlevel10k
antigen apply

# For tricking python packages into believing they are in macos 10.x to avoid compiling hell
export SYSTEM_VERSION_COMPAT=1

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
export PATH=/Users/cedric/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.cargo/bin:$PATH

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
  git rev-parse --verify main > /dev/null 2>&1 && export BRANCH=main; \
  git checkout $BRANCH && git fetch origin --prune && git branch | grep -v $BRANCH | xargs git branch -D && git reset --hard origin/$BRANCH'
alias gdu='export BRANCH=master; \
  git rev-parse --verify main > /dev/null 2>&1 && export BRANCH=main; \
  git checkout $BRANCH && git fetch upstream --prune && git branch | grep -v $BRANCH | xargs git branch -D && git reset --hard upstream/$BRANCH'
alias gpf="git push origin --force HEAD"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# Load pyenv into the shell by adding
# the following to ~/.zshrc:
eval "$(pyenv init -)"
#export PATH="$HOME/.pyenv/shims:$PATH"

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
alias publickey="cat ~/.ssh/id_ed25519.pub | pbcopy"
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

autoload -U +X bashcompinit && bashcompinit

alias ls=lsd

# Google Cloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
kssh() {
  IP=$(kubectl get nodes -o custom-columns='ip:status.addresses[0].address' --no-headers $1)
  ssh core@$IP $@[2,-1]
}

export WIREMIND_USERNAME=cdesaintmartin

complete -o nospace -C /usr/local/bin/mc mc

alias mayo="/Users/cedricdesaintmartin/Desktop/Wiremind/devops/mayo/.venv/bin/mayo"
. ~/mayo-complete.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
