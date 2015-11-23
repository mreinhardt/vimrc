#!/usr/bin/env bash
HEREDIR=$(dirname $0)

read -p "Installing to SSH server? [yN] " IS_SSH
if [[ $IS_SSH = "y" || $IS_SSH = "Y" ]]; then
    DEFAULTDIR=$HOME/.mvim
    IS_SSH=1
else
    DEFAULTDIR=$HOME/.vim
    IS_SSH=''
fi

read -p "What directory to install to? [default: $DEFAULTDIR] " INSTALLDIR
if [[ -z $INSTALLDIR ]]; then INSTALLDIR=$DEFAULTDIR; fi

mkdir -p $INSTALLDIR/colors
cp $HEREDIR/colors/* $INSTALLDIR/colors/.

curl -fLo $INSTALLDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ -n $IS_SSH ]]; then
    VIMRC=$HEREDIR/.vimrc
else
    VIMRC=$HEREDIR/.ssh.vimrc
fi
ln -s $VIMRC $INSTALLDIR/.vimrc
alias vm="vim -u $INSTALLDIR/.vimrc"

vm -c PlugInstall -c qa

