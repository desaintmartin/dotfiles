#!/bin/sh

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install youtube-dl autojump pyenv zsh tmux kubernetes-cli kubernetes-helm gnu-sed vim htop antigen thefuck mas nodejs yarn mosh
brew install gnu-sed --with-default-names
brew cask
brew cask install iterm2 istat-menus quicksilver nextcloud bettertouchtool spectacle clipy
brew cask install caskroom/versions/firefox-developer-edition

#mas install 497799835 # Xcode

./restore.sh

chsh -s /usr/bin/zsh
echo "\n/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

