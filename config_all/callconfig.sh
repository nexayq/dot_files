#!/bin/bash

# Make directories
    cd $HOME
    REPO_DIR=repos
    mkdir -p $REPO_DIR
    # mkdir -p .config/nvim
    # mkdir -p .atom

# Clone repos
    cd $HOME/$REPO_DIR
    # NK
    git clone https://github.com/nexayq/config_nk
    git clone https://github.com/nexayq/dot_files
    # Others
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Link files
    cd $HOME
    ln -s $REPO_DIR/dot_files/tmux/dot_tmux.conf .tmux.conf
    ln -s $REPO_DIR/dot_files/vim/dot_vimrc .vimrc
    # configure custom vim snippets (verilog)
    cd $HOME/.vim/
    ln -s $REPO_DIR/dot_files/vim/dot_vim/UltiSnips/
    cd $HOME
    # ln -s .vimrc .config/nvim/init.vim
    ln -s $REPO_DIR/dot_files/git/dot_gitconfig .gitconfig
    ln -s $REPO_DIR/dot_files/git/dot_git-prompt-colors.sh .git-prompt-colors.sh
    ln -s $REPO_DIR/config_nk/bash/callback.sh callback.sh
    ln -s $REPO_DIR/config_nk/dir_colors/dot_dir_colors .dir_colors

    # Python config
    ln -s $REPO_DIR/dot_files/python/pylint/dot_pylintrc .pylintrc
    cd $HOME/.config
    ln -s ../$REPO_DIR/dot_files/python/flake/flake8 flake8
    cd $HOME

    # rm callconfig.sh
    # ln -s $REPO_DIR/dot_files/config_all/callconfig.sh callconfig.sh

# Atom config
    # source $REPO_DIR/dot_files/atom/config_atom.sh

# Vim - install plugins
    # vim +PluginInstall +qa

# GitHub username and email
    cd $REPO_DIR/config_nk
    git config user.name nexayq
    git config user.email nexayq@users.noreply.github.com
    cd $REPO_DIR/dot_files
    git config user.name nexayq
    git config user.email nexayq@users.noreply.github.com
    cd $HOME

# Tweaks
    cd $HOME
    touch .nk_history

# Add source ~/callback.sh to .bashrc
