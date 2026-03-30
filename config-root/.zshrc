# Enable line comments in the terminal
setopt interactive_comments     # Enable
# unsetopt interactive_comments   # Disable


# Configure the cmd prompt
  # %n - username
  # %m - Macbook model number
  # %1~ - current working directory 
  # %# - show '#' if running w/ admin privs, '%' if not
  # %F - start color: black, white, yellow, green, red, blue, cyan, or magenta
  # %f - end color
  # %B - start bold
  # %b - end bold
  # %U - start underline
  # %u - end underline
  # %S - start highlight 
  # %s - end  highlight 
  # %T - Time(HH:MM 24hr) 
  # %t - Time(h:mm am/pm)

# export PROMPT='%F{g}%T%f:%F{c}%n%f:%F{y}%~%f$ '
export PROMPT='%F{g}%T%f:%F{y}%~%f$ '

# Set XML Indent Value 
export XMLLINT_INDENT="    "

# Add homebrew to the path
eval "$(/opt/homebrew/bin/brew shellenv)"

#set a default dir listing
alias ll='ls -al'
alias lrt='ls -Alrt'


# Set Google Gemini project
export GOOGLE_CLOUD_PROJECT=pji-digital-code-assist

# Enable cdr to track directory navigation history
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs

# Setup Navigation
  alias cd.='cd ../'
  alias .2='cd ../..'
  alias .3='cd ../../..'
  alias .4='cd ../../../..'
  alias .5='cd ../../../../..'
  alias .6='cd ../../../../../..'


# Maven Commands
  # Action Build Cmd
  # mvn --batch-mode --update-snapshots --settings .github/settings.xml clean verify jacoco:report -P run-failsafe
  alias mbuild='mvn --batch-mode --update-snapshots --settings .github/settings.xml clean verify jacoco:report'
  alias mcp="mvn clean package" 
  alias mcpst="mvn clean package -Dmaven.test.skip=true"
  alias mformat="mvn com.cosium.code:git-code-format-maven-plugin:format-code"


# Common Github Commands
  alias pull='git pull -p'
  alias push='git push'
  alias commit='git commit -am'
  alias status='git status'
  alias switch='git switch'
  alias swtich='git switch'
  alias rebase='git rebase'
  alias stash='git stash -m'
  alias findBranch="git branch -r --contains $1 "

  gclone()
  { 
    git clone git@bitbucket.org:pjicode/$1.git;
  }

  # Git Log Docs  
  # https://git-scm.com/docs/git-log#Documentation/git-log.txt---graph
  #alias glog='git log --pretty=format:"%C(yellow)%h%Creset %ad | %Cgreen%s%Creset %Cred%d%Creset %Cblue[%an]" --date=short --show-linear-break'
  alias glog="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)'"

  # Set the base Github location
  export DEV_HOME=$HOME/dev/

  # Navigate to Github root
  alias githome='cd $DEV_HOME/BitBucket'


# setup auto complete
autoload -Uz compinit
compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Set aliases for K8s Contexts
alias ccrnt='kubectl config current-context'
alias ctxt='kubectl config get-contexts'
alias dctxt='kubectl config use-context dev-context'
alias pctxt='kubectl config use-context prod-context'
alias tctxt='kubectl config use-context test-context'

# Setup Autocomplete  for kubectl 
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# General aliases
alias uuid="uuidgen | tr -d '\n' | pbcopy"
alias dhome="cd ~/dev/"
alias bb="cd ~/dev/BitBucket"
alias dtmp="cd ~/dev/tmp"

#set alias for inability to type
alias grpe='grep '
alias gerp='grep '
alias vmi='vim '
alias ivm='vim '

#Find to Grep function 
f2g() {

  if [[ -v 3 ]]; then
    GPARM=$3
  else
    GPARM="n"
  fi

  find . -name $1 -print0 | xargs -0 grep -$GPARM $2
}


# Manage Java Homes
alias java11='jenv global 11'
alias java17='jenv global 17'
alias java21='jenv global 21'
alias jhome='echo $JAVA_HOME'
alias jver='java -version'
alias jvers='jenv versions'

# Add JDK to the path
export PATH=$PATH:$JAVA_HOME/bin

# Add psql to the path 
export PATH=$PATH:/opt/homebrew/opt/libpq/bin


# Add local bin directory to the end of the path
export PATH=$PATH:$HOME/dev/local/bin

# Append rancher desktop to the path
export PATH=$PATH:$HOME/.rd/bin


# Add jenv to the path 
export PATH=$HOME/.jenv/bin:$PATH

# Dev Settup
  # Terraform aliases
  alias tfmt='alias tfmt;terraform fmt -recursive'
  alias tfmtchk='alias tfmtchk;terraform fmt -check -recursive'
  alias tval='alias tval;terraform validate'
  alias tinit='alias tinit;terraform init -backend=false -upgrade'

  # ReactJS Setup
  #export NPM_TOKEN=


# Tweak history settings
alias history="history 0"
export SAVEHIST=5000
export HISTSIZE=5000
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS


# In case this is needed to stop Apple Music after a restart
#launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

###
#   Go Settings
###

# Go Tools
#export PATH=$PATH:$HOME/go/bin 
#export GOPATH=~/dev/Go/gopath

# export GOROOT=/opt/homebrew/Cellar/go/1.21.3/libexec      # Not sure if we need this.  `go env GOROOT` gives the same value and everything seems to work


# Python Alias
alias python=python3
alias pip=pip3

activate()
{
  if [[ -z "$1" ]]; then 
    echo "Please provide a virtual python environment name or directory."
  elif [ -r "$DIEM_HOME/.python/$1/bin/activate" ]; then
    source $DIEM_HOME/.python/$1/bin/activate
  elif [ -r "$HOME/.venv/$1/bin/activate" ]; then
    source $HOME/.venv/$1/bin/activate
  elif [ -r "$1/bin/activate" ]; then
    source $1/bin/activate
  else 
    echo "Invalid virtual python environment: $1"
  fi;
}

 
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chad_whelan/Downloads/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chad_whelan/Downloads/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chad_whelan/Downloads/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chad_whelan/Downloads/tmp/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"



