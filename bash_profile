
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

function gci()
{
  git commit -a -m "$@"
}

function glog()
{
  git log -n10
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

function start_dev_processes()
{
  sudo nginx
  mongod run --config /usr/local/etc/mongod.conf
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
