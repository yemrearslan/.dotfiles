bindkey "^[[3~" delete-char         # preventing delete button to insert ~ chart. make it do it's actual job.
bindkey "^[[H"   beginning-of-line  # make home button act like home button
bindkey "^[[F"   end-of-line        # make end button act like end button 

zsh_add_file "plugins/coloring.zsh" # origin: https://github.com/ohmyzsh/ohmyzsh/blob/f82aa819310752ad754c4ebfd1ae499285ee556e/lib/theme-and-appearance.zsh 
zsh_add_file "plugins/git_prompt.zsh" # origin: https://github.com/ohmyzsh/ohmyzsh/blob/6dfc9b960f023f30d6c55a22fa8402d91beb8d1f/lib/git.zsh

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   fino-time
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

green(){echo "%F{040}$1%{$reset_color%}"}
blue(){echo "%F{033}$1%{$reset_color%}"}
dim(){echo "%F{239}$1%{$reset_color%}"}
yellow(){echo "%F{226}$1%{$reset_color%}"}
git_red(){echo "%F{202}$1%{$reset_color%}"}
orange(){echo "%F{130}$1%{$reset_color%}"}
pink(){echo "%F{140}$1%{$reset_color%}"}
red(){echo "%F{124}$1%{$reset_color%}"}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{239}on %F{147}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=$(git_red ✘✘✘)
ZSH_THEME_GIT_PROMPT_CLEAN=$(green ✔)

function virtualenv_info { [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') ' }

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '' && return
    echo '󰁔'
}

if [[ "$HOST" == "macbook" ]]; then 
    local hostname=$(blue $HOST)
elif [[ "$HOST" == "machine" ]]; then 
    local hostname=$(red $HOST)
elif [[ "$HOST" == "Makina" ]]; then 
    local hostname=$(orange $HOST)
else
    local hostname=$(yellow $HOST)
fi

local user=$(green %n)
local date=%D{%d.%m.%y} # date with format dd.mm.yy
local time=%* # 24hr time with seconds. # https://linux.die.net/man/3/strftime
time=$(pink $time)
#local hostname=$(blue $HOST)
local current_dir=$(yellow %~ )%{$reset_color%}

if [[ "$distro" == "termux" ]]; then
    local user=$(green emre)
    local hostname=$(blue galaxy)
fi

PROMPT="╭─ $user $(dim at) $hostname $(dim in) $current_dir \$(git_prompt_info) $date - $time
╰─\$(virtualenv_info)\$(prompt_char) "

