# Setup Mac

## system rubyでhomebrewをいれる
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# system rubyでrbenvをいれる
brew install openssl
brew install readline
brew install ruby-build
brew install rbenv

echo 'if which rbenv > /dev/null; then eval "$(rbenv init 0)"; fl' > ~/.bash_profile

rbenv install 2.1.0
rbenv rehash
rbenv global 2.1.0

## homebrew-caskいれる
brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install google-chrome
brew cask install dropbox
brew cask install skype
brew cask install alfred
brew cask alfred link
brew cask install limechat
brew cask install keyremap4macbook
brew cask install xtrafinder
brew cask install sublime-text
brew cask install google-drive
brew cask install iterm2

# ghに必要
brew tap jingweno/gh
brew install gh

# betaのやつをいれるにはここを使う
brew tap caskroom/homebrew-versions
brew cask install sublime-text3

brew install tmux
brew install mysql
brew install redis
brew install perl-build
brew install plenv
brew install git
brew install reattach-to-user-namespace
brew install gh
brew install ag
brew install mosh
brew install autossh # for ssh -D
brew install pstree
brew install python #=> pip install percol

# Google日本語入力

brew install autojump

# zacのために踏み台
autossh -M1081 -D1080 fumidai

# oh-my-zsh
# .zshrcのpluginのところにautojump追加
# ZSH_CUSTOM変更したりとか

# 隠しファイルも見えるようにする
defaults write com.apple.finder AppleShowAllFiles TRUE

# .gitconfigの設定

## perlをいれる
echo 'if which plenv > /dev/null; then eval "$(plenv init 0)"; fl' > ~/.bash_profile
plenv install 5.18.1
plenv rehash
plenv global 5.18.1

## どこでもMyMac設定など
