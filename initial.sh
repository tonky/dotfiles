echo ">>> go ahead and install these packages, i'll wait"
echo ">>> git zsh neovim tlp htop powertop"

echo ">>> generating ssh keys"
ssh-keygen

echo ">>> creating directories"
mkdir -p ~/go/bin
mkdir -p ~/projects

echo ">>> cloning dotfiles"
git clone https://github.com/tonky/dotfiles.git ~/projects/dotfiles

echo ">>> creating symlinks"
ln -s ~/projects/dotfiles/bin ~
ln -s ~/projects/dotfiles/.zsh ~
ln -s ~/projects/dotfiles/.zshrc ~
ln -s ~/projects/dotfiles/.zshrc_local ~
ln -s ~/projects/dotfiles/.gitconfig ~
ln -s ~/projects/dotfiles/nvim ~/.config/

echo ">>> setting zsh as default shell"
chsh -s /usr/bin/zsh

echo ">>> here's your id_rsa.pub"
cat ~/.ssh/id_rsa.pub
