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
export PROMPT='%F{c}%n%f:%F{y}%~%f$ '

# Add homebrew to the path
eval "$(/opt/homebrew/bin/brew shellenv)"

#set a default dir listing
alias ll='ls -al'
alias lrt='ls -Alrt'

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


# Common Github Commands
  # Action Build Cmd
  # mvn --batch-mode --update-snapshots --settings .github/settings.xml clean verify jacoco:report -P run-failsafe
  alias mbuild='mvn --batch-mode --update-snapshots --settings .github/settings.xml clean verify jacoco:report'
  alias mcp="mvn clean package -Dmaven.test.skip=true"

  alias pull='git pull -p'
  alias push='git push'
  alias commit='git commit -am'
  alias status='git status'
  alias switch='git switch'
  #alias gmod='git merge origin/develop'
  alias rebase='git rebase'
  alias gstash='git stash'

  # Git Log Docs  
  # https://git-scm.com/docs/git-log#Documentation/git-log.txt---graph
  #alias glog='git log --pretty=format:"%C(yellow)%h%Creset %ad | %Cgreen%s%Creset %Cred%d%Creset %Cblue[%an]" --date=short --show-linear-break'
  alias glog="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all"

  # Set the base Github location
  export GIT_HOME=$HOME/Dev

  # Navigate to Github root
  alias githome='cd $GIT_HOME'


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


#set alias for inability to type
alias grpe='grep '

# And set JAVA_HOME
# Might change at new job 
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/default/Contents/Home

# Manage Java Homes
# Might change at new job
alias java11='unset JAVA_HOME;export JAVA_HOME=$(/usr/libexec/java_home -v 11);java -version'
alias java17='unset JAVA_HOME;export JAVA_HOME=$(/usr/libexec/java_home -v 17);java -version'
alias java21='unset JAVA_HOME;export JAVA_HOME=$(/usr/libexec/java_home -v 21);java -version'
alias jhome='echo $JAVA_HOME'
alias jver='java -version'

# Add JDK to the path
path+=('$JAVA_HOME/bin')

# Add psql to the path 
path+=('/opt/homebrew/opt/libpq/bin')


# Add local bin directory to the end of the path
path+=($HOME/dev/local/bin)

# Append rancher desktop to the path
path+=($HOME/.rd/bin)

# Or prepend it
# path=($HOME/.rd/bin $path)


# AZ Settings
export DEV_RG=""
export PROD_RG=""

# Dev Settup
  export CRYPT_KEY=

  # Run jascrypt decrypt.sh to decrypt client passwords:
  # decrypt input=<encrypted password>= password=$CRYPT_KEY algorithm=PBEWITHMD5ANDDES ivGeneratorClassName=org.jasypt.iv.NoIvGenerator

  # JFrog setup
  #export ARTIFACTORY_USERNAME=charles.whelan@kroger.com
  #export ARTIFACTORY_TOKEN=
        
  alias jfrog_auth='curl -u $ARTIFACTORY_USERNAME:$ARTIFACTORY_TOKEN https://???.jfrog.io/artifactory/api/npm/auth/'
  
  # JFrog IntelliJ setup
  export JFROG_IDE_USERNAME=$ARTIFACTORY_USERNAME
  export JFROG_IDE_ACCESS_TOKEN=$ARTIFACTORY_TOKEN


  # Terraform aliases
  alias tfmt='alias tfmt;terraform fmt -recursive'
  alias tfmtchk='alias tfmtchk;terraform fmt -check -recursive'
  alias tval='alias tval;terraform validate'
  alias tinit='alias tinit;terraform init -backend=false -upgrade'

  # ReactJS Setup
  export NPM_TOKEN=


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
path+=('/Users/cw87992/go/bin/')
export GOPATH=~/dev/Go/gopath
# export GOROOT=/opt/homebrew/Cellar/go/1.21.3/libexec      # Not sure if we need this.  `go env GOROOT` gives the same value and everything seems to work



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


 
# Finally Set the PATH variable
typeset -U path
export PATH


