#!/bin/sh

set -e
set -x

# Homebrew
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install youtube-dl autojump pyenv zsh tmux kubernetes-cli kubernetes-helm gnu-sed vim htop antigen thefuck mas nodejs yarn mosh lsd krew

brew cask install iterm2 gimp textmate istat-menus quicksilver nextcloud bettertouchtool spectacle clipy amethyst homebrew/cask-drivers/logitech-options homebrew/cask-versions/firefox-developer-edition istat-menus nextcloud docker google-cloud-sdk quicksilver grandperspective spectacle visual-studio-code the-unarchiver wireshark buttercup kubernetic xquartz clipy google-drive-file-stream macdown google-chat
# Optional
# brew cask install cyberduck vlc android-platform-tools github osxfuse webex-meetings bettertouchtool dolphin google-chrome pycharm transmission veracrypt zoom console microsoft-teams
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

#mas install 497799835 # Xcode

[ -n "$(xcode-select -p)" ] || xcode-select --install

mkdir -p ~/Library/Application\ Support/Spectacle
PREFERENCE_SOURCE=~/dotfiles/mac/Shortcuts.json
PREFERENCE_DESTINATION=~/Library/ApplicationSupport/Spectacle/Shortcuts.json
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi

PREFERENCE_SOURCE=~/dotfiles/mac/com.googlecode.iterm2.plist
PREFERENCE_DESTINATION=~/Library/Preferences/com.googlecode.iterm2.plist
if [ ! -f "$PREFERENCE_DESTINATION" ]; then
  ln -s "$PREFERENCE_SOURCE" "$PREFERENCE_DESTINATION"
fi


./restore.sh

ZSH_SHELL="/usr/local/bin/zsh"
[ -n "$(grep $ZSH_SHELL /etc/shells)" ] || echo "\n/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

