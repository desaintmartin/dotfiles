#!/bin/sh

set -e
set -x

# Homebrew
/opt/homebrew/bin/brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install youtube-dl autojump pyenv zsh tmux kubernetes-cli kubernetes-helm gnu-sed vim htop antidote thefuck mas nodejs yarn mosh lsd krew

/opt/homebrew/bin/brew install --adopt \
  android-platform-tools \
  clipy \
  console \
  cyberduck \
  docker \
  firefox@developer-edition \
  gimp \
  github \
  google-chrome \
  google-cloud-sdk \
  grandperspective \
  logitech-options \
  iterm2 \
  kubernetic \
  kubecontext \
  launchcontrol \
  nextcloud \
  quicksilver \
  rectangle \
  sensiblesidebuttons \
  shellcheck \
  stats \
  textmate \
  the-unarchiver \
  visual-studio-code \
  vlc \
  uninstallpkg \
  wireshark \
  xquartz \
  font-hack-nerd-font

#mas install 497799835 # Xcode

[ -n "$(xcode-select -p)" ] || xcode-select --install

PREFERENCE_SOURCE=~/dotfiles/mac/com.googlecode.iterm2.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.googlecode.iterm2.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi


# ./restore.sh

ZSH_SHELL="/opt/homebrew/bin/zsh"
[ -n "$(grep $ZSH_SHELL /etc/shells)" ] || echo "\n/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh

ssh-add --apple-use-keychain ~/.ssh/id_ed25519
