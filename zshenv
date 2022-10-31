#!/bin/zsh

# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# ZSH Files
export ZDOTDIR=$HOME/.config/zsh
# export HISTFILE=$HOME/.config/zsh/history

# Androd ADB
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

# x11 stuff
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

# wget
#export WGETRC=$HOME/.config/wgetrc

#~/.config/git/config
# git (.gitconfig dosyasını buraya taşımak yeterli oluyor)

export SYSCONFDIR="$XDG_CONFIG_HOME"
