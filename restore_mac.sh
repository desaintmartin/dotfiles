#!/bin/sh

set -e
set -x

# Homebrew
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install youtube-dl autojump pyenv zsh tmux kubernetes-cli kubernetes-helm gnu-sed vim htop antigen thefuck mas nodejs yarn mosh lsd krew

brew install --cask \
  amethyst \
  android-platform-tools \
  bettertouchtool \
  buttercup \
  clipy \
  console \
  cyberduck \
  docker \
  gimp \
  github \
  google-chrome \
  google-cloud-sdk \
  google-drive-file-stream \
  grandperspective \
  homebrew/cask-drivers/logitech-options \
  homebrew/cask-versions/firefox-developer-edition \
  istat-menus \
  iterm2 \
  kubernetic \
  kubecontext \
  macdown
  microsoft-teams \
  nextcloud \
  pycharm \
  quicksilver \
  rectangle \
  sensiblesidebuttons \
  spectacle \
  textmate \
  the-unarchiver \
  visual-studio-code \
  vlc \
  webex-meetings \
  wireshark \
  xquartz
  zoom \
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

#mas install 497799835 # Xcode

[ -n "$(xcode-select -p)" ] || xcode-select --install

PREFERENCE_SOURCE=~/dotfiles/mac/com.googlecode.iterm2.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.googlecode.iterm2.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi


./restore.sh

ZSH_SHELL="/usr/local/bin/zsh"
[ -n "$(grep $ZSH_SHELL /etc/shells)" ] || echo "\n/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

