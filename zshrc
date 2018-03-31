if [ -f "/usr/share/zsh-antigen/antigen.zsh" ]; then;
  source /usr/share/zsh-antigen/antigen.zsh
else
  source /usr/local/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh
antigen theme https://github.com/iam4x/zsh-iterm-touchbar
antigen bundles <<EOBUNDLES
    cp
    history
    osx
    compleate
    npm
    screen
    ssh-agent
    textmate
    brew
    python
    sudo

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions
EOBUNDLES
antigen theme dieter
antigen apply

# Customize to your needs...

export HISTSIZE=100000         # Increases size of history
export SAVEHIST=100000

# Non-standard paths :
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/Users/cedricdesaintmartin/.gem/ruby/1.8/bin:$PATH
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

# macvim
MACVIM=/Applications/MacVim.app
if [ -d $MACVIM ]; then
  alias vim='$MACVIM/Contents/MacOS/Vim'
fi

#pyenv
eval "$(pyenv init -)"
#source ~/.pyenv/completions/pyenv.zsh


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
function fullps {
perl -e '$p=shift;open MAPS, "/proc/$p/maps";
          ($m)=grep /\[stack\]/, <MAPS>;
          ($a,$b)=map hex, $m =~ /[\da-f]+/g;
          open MEM, "/proc/$p/mem";
          seek MEM,$a,0; read MEM, $c,$b-$a;
          print((split /\0{2,}/,$c)[-1])' "$1" | tr \\0 \\n | head
}

# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# thefuck
eval $(thefuck --alias)

