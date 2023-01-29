# Setup Prompt
fpath=(~/.prompt $fpath)
autoload -Uz prompt; prompt


if [[ `uname` == "Darwin" ]]; then
  source ~/.zshrc.d/mac.zsh
  source ~/.zshrc.d/falcon.zsh
fi

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
alias creds-unset="unset FALCON_CLIENT_ID FALCON_CLIENT_SECRET FALCON_CID FALCON_PROV_TOKEN"

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



# Automatic Issues
sensor_api_repos='crowdstrike/puppet-falcon,crowdstrike/falcon-scripts,crowdstrike/chef-falcon,crowdstrike/ansible_collection_falcon'

alias create-issues='function _create-issues() {
  if [ "$#" -lt 2 ]; then
    echo "Error: At least two arguments are required." >&2
    return 1
  fi
  IFS=',' read -r -A repos <<< "$1"
  shift
  for repo in "${repos[@]}"; do
    issues=$(gh issue list -R "$repo" --json title --state "open")
    if ! jq -e ". | any(.title == \"$2\")" <<< "$issues" > /dev/null; then
      gh issue create -R "$repo" "$@"
    else
      echo "Skipping $repo: issue with title '$2' already exists." >&2
    fi
  done
}; _create-issues'


# Fix Vagrant for Windows support
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Molcule
alias srcmolecule="source ~/.pyenv/molecule/bin/activate"

# VSCODE
alias code="code . -r"
