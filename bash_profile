export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/.rbenv/shims:$PATH"

export EDITOR='vim'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 "(%s)")$ '
export CLICOLOR=1

if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

function hs(){
  python -m SimpleHTTPServer "$@"
}

function gci()
{
  git commit -a -m "$@"
}

function glog()
{
  git log -n10 --graph --date=local --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' "$@"
}

function gco()
{
  git co "$@"
}

function push()
{
  git push -u
}

function pull()
{
  git pull -u
}

function log()
{
  > log/development.log
  tail -f -n200 log/development.log
}

function kmux()
{
  tmux kill-session -t "$@"
}

function pgr()
{
  pg_restore --verbose --clean --no-acl --no-owner -h localhost "$@"
}
function pgd()
{
  pg_dump -Fc --no-acl --no-owner -h localhost "$@"
}

function refresh_dns()
{
  sudo killall -HUP mDNSResponder
}

export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"

function sdocker(){
  eval "$(docker-machine env default)"
}

function proxy() {
  proxychains4 "$@"
  # privoxy configuration
  # privoxy  /usr/local/etc/privoxy/config
  # export http_proxy='http://127.0.0.1:6152'
  # export https_proxy='http://127.0.0.1:6152'
}
