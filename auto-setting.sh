#!/bin/sh

# copy vimrc and setup vundle
\cp vimrc ~/.vimrc
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
\vim "+call minpac#update()" +qall

# copy gitconfig
\cp gitconfig ~/.gitconfig

# copy tmux conf
\cp tmux.conf ~/.tmux.conf

# get git completion file
\wget  -P ~ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
\mv ~/git-completion.bash ~/.git-completion.bash

# install git prepare commit message hook
\cp prepare-commit-msg /usr/local/share/git-core/templates/hooks/

# get django completion file
\wget -P ~ https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion
\mv ~/django_bash_completion ~/.django_bash_completion

# setup zshrc
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cp zshrc ~/.zshrc
cp zpreztorc ~/.zpreztorc
chsh -s /bin/zsh
