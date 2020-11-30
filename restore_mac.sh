#!/bin/sh

set -e
set -x

# Homebrew
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install youtube-dl autojump pyenv zsh tmux kubernetes-cli kubernetes-helm gnu-sed vim htop antigen thefuck mas nodejs yarn mosh

brew cask install iterm2 istat-menus quicksilver nextcloud bettertouchtool spectacle clipy
brew cask install homebrew/cask-versions/firefox-developer-edition
# Optional
# brew cask install amethyst cyberduck gimp istat-menus nextcloud vlc android-platform-tools docker github iterm2 osxfuse textmate webex-meetings bettertouchtool dolphin google-chrome the-unarchiver wireshark buttercup google-cloud-sdk kubernetic pycharm transmission xquartz clipy google-drive-file-stream macdown quicksilver veracrypt zoom console grandperspective microsoft-teams spectacle visual-studio-code

#mas install 497799835 # Xcode

[ -n "$(xcode-select -p)" ] || xcode-select --install

./restore.sh

ZSH_SHELL="/usr/local/bin/zsh"
[ -n "$(grep $ZSH_SHELL /etc/shells)" ] || echo "\n/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

