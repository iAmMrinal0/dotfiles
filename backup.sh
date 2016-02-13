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
cp $HOME/.emacs $HOME/dotfiles/
echo ".emacs done"
cp $HOME/.mpd/mpd.conf $HOME/dotfiles/.mpd
echo "mpd done"
cp $HOME/.ncmpcpp/config $HOME/dotfiles/.ncmpcpp
echo "ncmpcpp done"
cp $HOME/.config/compton.conf $HOME/dotfiles/.config/
echo "compton done"
cp $HOME/.config/terminator/config $HOME/dotfiles/.config/terminator/
cp $HOME/.mutt/*.rc $HOME/dotfiles/.mutt/
echo "mutt"
