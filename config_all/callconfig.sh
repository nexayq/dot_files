#!/bin/bash

# Make directories
    cd $HOME
    CONFIG_DIR=config_nk
    mkdir -p $CONFIG_DIR
    mkdir -p .config/nvim
    mkdir -p .atom

# Clone repos
    cd $HOME/$CONFIG_DIR
    # NK
    git clone https://bitbucket.org/nexayq/config
    git clone https://github.com/nexayq/dot_files
    # Others
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Link files
    cd $HOME
    ln -s $CONFIG_DIR/dot_files/tmux/dot_tmux.conf .tmux.conf
    ln -s $CONFIG_DIR/dot_files/vim/dot_vimrc .vimrc
    # ln -s .vimrc .config/nvim/init.vim
    ln -s $CONFIG_DIR/dot_files/git/dot_gitconfig .gitconfig
    ln -s $CONFIG_DIR/dot_files/git/dot_git-prompt-colors.sh .git-prompt-colors.sh
    ln -s $CONFIG_DIR/config/bash/callback.sh callback.sh
    ln -s $CONFIG_DIR/config/dir_colors/dot_dir_colors .dir_colors

    # Python config
    ln -s $CONFIG_DIR/dot_files/python/pylint/dot_pylintrc .pylintrc
    cd $HOME/.config
    ln -s ../$CONFIG_DIR/dot_files/python/flake/flake8 flake8
    cd $HOME

    # rm callconfig.sh
    # ln -s $CONFIG_DIR/dot_files/config_all/callconfig.sh callconfig.sh

# Atom config
    source $CONFIG_DIR/dot_files/atom/config_atom.sh

# Vim - install plugins
    vim +PluginInstall +qa

# GitHub username and email
    cd $CONFIG_DIR/dot_files
    git config user.name nexayq
    git config user.email nexayq@users.noreply.github.com
    cd -

# Tweaks
    cd $HOME
    touch .nk_history

# Add source ~/callback.sh to .bashrc
