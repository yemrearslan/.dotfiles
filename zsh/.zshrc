export PATH="$HOME/.keys/scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
#export EDITOR=nvim
export BROWSER="brave"
export COLORTERM=truecolor
#export TERM=xterm-256color

#ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true
HISTFILE=~/.cache/zshhistory
HISTSIZE=100000
SAVEHIST=100000

setopt autocd beep extendedglob		# nomatch
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit	# zsh autocomplete init

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_file_fullpath() {
    [ -f "$1" ] && source "$1"
}

#zsh_add_file "plugins/preferences.zsh"
zsh_add_file_fullpath "$HOME/.keys/preferences.zsh"
zsh_add_file "plugins/prompt.zsh"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_plugin "davidde/git"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

function git-lazy() {
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

function git-fixssh() {
	eval $(ssh-agent -s)
	ssh-add $DEFAULT_SSH_KEY
}

function git-create-push(){
    git push --set-upstream-to git@gitlab.com:yemrearslan/$1.git master
}

wifi-setdns(){
	nmcli -g name,type connection show --active | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
	do
	  nmcli con mod "$connection" ipv6.ignore-auto-dns yes
	  nmcli con mod "$connection" ipv4.ignore-auto-dns yes
	  nmcli con mod "$connection" ipv4.dns "8.8.8.8 8.8.4.4"
	  nmcli con down "$connection" && nmcli con up "$connection"
	done
}
wifi-reconnect(){
	nmcli -g name,type connection show --active | awk -F: '/ethernet|wireless/ { print $1 }' | while read connection
	do
		nmcli con down "$connection" && nmcli con up "$connection"
	done
}

# preferences
alias vi="nvim"
alias vim="vi"
alias sudo='sudo '
alias vimrc="nvim ~/.config/nvim/"
alias sshconfig="nvim ~/.ssh/config"
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias sourcezsh="source ~/.config/zsh/.zshrc"
alias top="btop"
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias l='exa --icons'
alias ll='exa -lah --icons'
alias md='mkdir -p'
alias rd='rm -r'
alias mkdir='mkdir -p'
alias grep="grep --color='auto'"
alias wget="wget --hsts-file ~/.config/wget/wget-hsts"
alias gitfetch="onefetch"
alias yt="ytfzf"
alias ip="ip -c"
alias s="kitty +kitten ssh"
#alias curl="curlie --pretty"
#alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# useful
wifi-connect(){sudo nmcli device wifi connect $1 password $2}
check-port(){ss -plant | grep :$1}	# which pid uses that port
kill-port(){kill -9 $(lsof -t -i tcp:$1)}
burn(){sudo dd if=$1 of=$2 bs=10M status=progress}
alias watchcpu='watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"'
alias ramspeed='sudo dmidecode --type 17 | grep Speed'
alias mp3="youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0"
alias mp3playlist="youtube-dl -ict --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0"
alias wifi-on="sudo nmcli radio wifi on"
alias wifi-off="sudo nmcli radio wifi off"
alias wifi-scan="nmcli device wifi list"
alias down="yt-dlp"
alias publicip="curlie ipinfo.io --pretty"
alias pi="curl -L https://ipgrab.io" # ipinfo.io/ip
alias map="telnet mapscii.me"
alias rate="curl usd.rate.sx/eth@30d"
alias matrix="neo-matrix"
#alias monitor-list="xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1"
#alias monitor-off="xrandr --output $(monitor-list) --off"
alias mpv-cli="mpv -vo tct"
alias setupvpn="nmcli connection import type openvpn file "  # pass .ovpn file location
alias sysinfo="sudo inxi -v8"
alias mario="$HOME/Downloads/super_mario/Super_Mario_127_0.7.2.x86_64"
alias logs="journalctl -xef -p 3"
alias weather="curl wttr.in/mersin"
alias serve="python3 -m http.server 9000"
alias filetypes="for file in ./*(.); do file $file; done"
alias rsync="rsync -varz --info=progress2"
alias dc="docker-compose"
alias bul="find . -name"
alias ara="find . -name"
fastfetch
