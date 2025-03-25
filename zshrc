# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
source <(antidote init)

antidote bundle ohmyzsh/ohmyzsh

antidote bundle <<EOBUNDLES
    ohmyzsh/ohmyzsh path:plugins/autojump/autojump.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/brew/brew.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/common-aliases/common-aliases.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/compleat/compleat.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/helm/helm.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/history/history.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/iterm2/iterm2.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/kubectl/kubectl.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/kube-ps1/kube-ps1.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/macos/macos.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/pip/pip.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/python/python.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/screen/screen.plugin.zsh
    ohmyzsh/ohmyzsh path:plugins/uv/uv.plugin.zsh

    # popular fish-like plugins
    mattmc3/zfunctions
    zsh-users/zsh-autosuggestions
    zdharma-continuum/fast-syntax-highlighting kind:defer
    zsh-users/zsh-history-substring-search

    # Extra zsh completions
    zsh-users/zsh-completions

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    romkatv/powerlevel10k
EOBUNDLES

# For tricking python packages into believing they are in macos 10.x to avoid compiling hell
#export SYSTEM_VERSION_COMPAT=1

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTSIZE=1000000         # Increases size of history
export SAVEHIST=1000000

# Non-standard paths :
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/share/npm/bin:$PATH
export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/Users/cedric/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.cargo/bin:$PATH

# node.js
export NODE_PATH=/opt/homebrew/lib/node:/opt/homebrew/share/npm/lib/node_modules/

# SSL
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"

# Go
#export GOPATH=$HOME/go

# git alias
alias git-gui="/opt/homebrew/git/share/git-gui/lib/Git\ Gui.app/Contents/MacOS/Wish"
alias ga="git commit --amend -a -C HEAD"
alias gr="git rebase -i origin/master"
alias gd='export BRANCH=master; \
  git rev-parse --verify main > /dev/null 2>&1 && export BRANCH=main; \
  git checkout $BRANCH && git fetch origin --prune && git branch | grep -v $BRANCH | xargs git branch -D && git reset --hard origin/$BRANCH'
alias gdu='export BRANCH=master; \
  git rev-parse --verify main > /dev/null 2>&1 && export BRANCH=main; \
  git checkout $BRANCH && git fetch upstream --prune && git branch | grep -v $BRANCH | xargs git branch -D && git reset --hard upstream/$BRANCH'
alias gpf="git push origin --force --no-verify HEAD"

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

alias brew-update="brew update && brew upgrade && brew upgrade --cask && brew autoremove && brew cleanup"

source <(kubectl completion zsh)
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

alias ls=lsd

# Google Cloud
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kssh() {
  IP=$(kubectl get nodes -o jsonpath='{.status.addresses[?(@.type=="InternalIP")].address}' --no-headers $1)
  ssh core@$IP $@[2,-1]
}
export HELM_CONFIG_HOME="/Users/cedricdesaintmartin/Library/Preferences/helm"

export WIREMIND_USERNAME=cdesaintmartin

complete -o nospace -C /opt/homebrew/bin/mc mc

# mayo
alias mayo=/Users/cedricdesaintmartin/Desktop/Wiremind/devops/mayo/.venv/bin/mayo
alias cluster-manager=/Users/cedricdesaintmartin/Desktop/Wiremind/devops/cluster-manager/.venv/bin/cluster-manager
. ~/mayo-complete.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#ssh-add ~/.ssh/id_ed25519
