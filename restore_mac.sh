#!/bin/sh

set -e
set -x

# Homebrew
/opt/homebrew/bin/brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install \
  antidote \
  autojump \
  awscli \
  buildkit \
  docker \
  glab \
  gnu-sed \
  helm \
  helmfile \
  htop \
  istioctl \
  jq \
  krew \
  kubernetes-cli \
  lsd \
  mas \
  mosh \
  mtr \
  node \
  pwgen \
  pyenv \
  thefuck \
  tmux \
  uv \
  vim \
  wireshark \
  yq \
  zsh

/opt/homebrew/bin/brew install --adopt \
  android-platform-tools \
  bitwarden \
  clipy \
  console \
  cyberduck \
  firefox@developer-edition \
  font-hack-nerd-font \
  gimp \
  github \
  google-chrome \
  google-cloud-sdk \
  grandperspective \
  iterm2 \
  itsycal \
  kubecontext \
  kubernetic \
  launchcontrol \
  lens \
  logitech-options \
  lulu \
  nextcloud \
  notion-calendar \
  quicksilver \
  rectangle \
  sensiblesidebuttons \
  signal \
  shellcheck \
  slack \
  stats \
  teamviewer \
  textmate \
  the-unarchiver \
  uninstallpkg \
  visual-studio-code \
  vlc \
  xquartz

#mas install 497799835 # Xcode

[ -n "$(xcode-select -p)" ] || xcode-select --install

PREFERENCE_SOURCE=~/dotfiles/mac/com.googlecode.iterm2.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.googlecode.iterm2.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi

PREFERENCE_SOURCE=~/dotfiles/mac/com.blacktree.Quicksilver.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.blacktree.Quicksilver.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi

PREFERENCE_SOURCE=~/dotfiles/mac/com.knollsoft.Rectangle.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.knollsoft.Rectangle.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi

PREFERENCE_SOURCE=~/dotfiles/mac/p10k.zsh
PREFERENCE_DESTINATION=~/.p10k.zsh
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi

./restore.sh

ZSH_SHELL="/opt/homebrew/bin/zsh"
[ -n "$(grep $ZSH_SHELL /etc/shells)" ] || echo "\n/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/zsh

ssh-add --apple-use-keychain ~/.ssh/id_ed25519
