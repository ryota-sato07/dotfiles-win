#-------------------------------------------------------------------------------
# install command
#-------------------------------------------------------------------------------
#!/bin/bash

# cd ~/

# brew がインストールされていなければインストール
# cif [ -z "$(command -v brew)" ]; then
#     echo 'start: Install Homebrew'
#
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     brew -v
#     brew bundle
#
#     echo 'end: Install Homebrew'
# fi

# vim-plug インストール
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# cd ~/dotfiles

# Brewfile のパッケージインストール
# brew bundle

# echo '
# ===========================
# start: setup Symbolic Links
# ===========================
# '

mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles-win\vim\.vimrc"
mklink %HOMEPATH%"\Code\User\settings.json" %HOMEPATH%"\dotfiles-win\cursor\settings.json"
mklink %HOMEPATH%"\Code\User\keybindings.json" %HOMEPATH%"\dotfiles-win\cursor\keybindings.json"

# echo '
# ==============================
# complete: setup Symbolic Links
# ==============================
# '
