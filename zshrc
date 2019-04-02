if [ -f "/usr/share/zsh-antigen/antigen.zsh" ]; then;
  source /usr/share/zsh-antigen/antigen.zsh
else
  source /usr/local/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh
antigen theme https://github.com/iam4x/zsh-iterm-touchbar
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
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=/usr/local/opt/curl/bin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.gem/ruby/1.8/bin:$PATH
export PATH=/Applications/FirefoxNightly.app/Contents/MacOS:$PATH
export PATH=/Users/cedricdesaintmartin/.cargo/bin:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"

# node.js
export NODE_PATH=/usr/local/lib/node:/usr/local/share/npm/lib/node_modules/

# Go
export GOPATH=$HOME/go

# git alias
alias git-branch-delete="git branch -D `git branch --merged | grep -v \* | xargs`"
alias git-gui="/usr/local/git/share/git-gui/lib/Git\ Gui.app/Contents/MacOS/Wish"
alias git-auto-fixup="git add \* && git commit --fixup=HEAD && git rebase -i --autosquash HEAD~2"

# macvim
MACVIM=/Applications/MacVim.app
if [ -d $MACVIM ]; then
  alias vim='$MACVIM/Contents/MacOS/Vim'
fi

#pyenv
eval "$(pyenv init -)"
#source ~/.pyenv/completions/pyenv.zsh


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
eval $(thefuck --alias)

# Python
alias simplehttpserver="python -m SimpleHTTPServer 8080"

# iTerm2
source ~/dotfiles/iterm2_shell_integration.zsh

# SSH Agent
#ssh-add -K ~/.ssh/id_rsa
#ssh-add -A

