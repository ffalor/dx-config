# Setup Prompt
fpath=(~/.prompt $fpath)
autoload -Uz prompt; prompt

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ffalor/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ffalor/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/ffalor/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ffalor/google-cloud-sdk/completion.zsh.inc'; fi

# Source files
source ~/.zshrc.d/falcon.zsh

# Github & Git Aliases
alias main="git checkout main"
alias gch="git checkout"
alias gb="git branch"
alias gp="git pull"
alias gs="git status"
alias gc="git commit -m"
alias gac="git add . && git commit -m"
alias ga="git add ."
alias gnb="git checkout -b"
alias gbd="main && git branch -d"
alias gpurge="git branch | grep -v "main" | xargs git branch -D"

# .zshrc aliases
alias z="code ~/.zshrc"
alias z-reload="source ~/.zshrc"

# docker aliases
alias d="docker"
alias db="docker build . -t"

# misc
alias c="clear"
alias tip="curl ipinfo.io | jq -r '.ip' | pbcopy"

# create creds alias that runs printenv greps for FALCON adds export to the front and then pipes to pbcopy
alias creds="printenv | grep FALCON | sed 's/^/export /' | pbcopy"
alias creds-unset="unset FALCON_CLIENT_ID FALCON_CLIENT_SECRET FALCON_CID"

# launch programs
alias launch-docker="open -a Docker"

# Setup thefuck
eval "$(thefuck --alias)"

fuck-command-line() {
    local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    [[ -z $FUCK ]] && echo -n -e "\a" && return
    BUFFER=$FUCK
    zle end-of-line
}
zle -N fuck-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '^f' fuck-command-line
bindkey -M vicmd '^f' fuck-command-line
bindkey -M viins '^f' fuck-command-line