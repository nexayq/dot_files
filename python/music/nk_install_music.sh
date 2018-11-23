#!/bin/bash

CONFIG_DIR=config_nk
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# youtube-dl directories
mkdir -p $HOME/local_sw/youtube-dl/
cd $HOME/local_sw/youtube-dl/

# check if file already exists
if [ ! -f "youtube-dl" ]; then
    wget https://yt-dl.org/downloads/latest/youtube-dl
fi

# create link to youtube-dl in "local_bin"
mkdir -p $HOME/local_bin/
cd $HOME/local_bin/
if [ ! -L "youtube-dl" ]; then
    ln -s ../local_sw/youtube-dl/youtube-dl
fi

# create link to nk_music_download
cd $HOME/local_bin/
if [ ! -L "nk_music_download" ]; then
    ln -s $HOME/$CONFIG_DIR/dot_files/python/music/nk_music_download
fi

# install needed packages
sudo apt-get install ffmpeg
sudo apt-get install cutmp3
sudo apt-get install mp3splt
sudo apt-get install sox libsox-fmt-mp3 libsox-fmt-all

# update beautifulsoup, html5lib
    # pip install --upgrade beautifulsoup4 --user
    # pip install --upgrade html5lib --user

# get back to script_dir
cd $script_dir
