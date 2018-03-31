#!/bin/bash

# Make directories
    cd $HOME
    CONFIG_DIR=config_nk
    mkdir -p .atom

# Link files
    # Atom config
    cd $HOME/.atom
    ln -s ../$CONFIG_DIR/dot_files/atom/config.cson config.cson
    ln -s ../$CONFIG_DIR/dot_files/atom/packages.cson packages.cson
    ln -s ../$CONFIG_DIR/dot_files/atom/keymap.cson keymap.cson
    cd $HOME
