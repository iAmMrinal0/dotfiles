#! /bin/zsh

echo "Starting..."
echo "Copying .i3 folder"
cp -R $HOME/.i3/ $HOME/dotfiles/
echo ".i3 done"
echo "Starting .bin folder"
cp -R $HOME/.bin/ $HOME/dotfiles/
echo ".bin done"
cp $HOME/.zshrc $HOME/dotfiles/
echo "zshrc done"
