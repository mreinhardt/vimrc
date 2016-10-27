#!/usr/bin/env bash
HEREDIR=$(pwd)

read -p "Installing to SSH server? [yN] " IS_SSH
if [[ $IS_SSH = "y" || $IS_SSH = "Y" ]]; then
    DEFAULTDIR=$HOME/.mvim
    IS_SSH=true
else
    DEFAULTDIR=$HOME/.vim
    IS_SSH=false
fi

read -p "What directory to install to? [default: $DEFAULTDIR] " INSTALLDIR
if [[ -z $INSTALLDIR ]]; then INSTALLDIR=$DEFAULTDIR; fi

mkdir -p $INSTALLDIR/colors
cp $HEREDIR/colors/* $INSTALLDIR/colors/.

curl -fLo $INSTALLDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ $IS_SSH == true ]]; then
    VIMRC=$HEREDIR/.ssh.vimrc
else
    VIMRC=$HEREDIR/.vimrc
fi
echo $VIMRC
ln -s $VIMRC $INSTALLDIR/.vimrc

vim -u $INSTALLDIR/.vimrc -c PlugInstall -c qa

echo "Add \`alias vm='vim -u $INSTALLDIR/.vimrc'\` to execute your custom vim with \`vm\`"

