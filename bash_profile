LDFLAGS="$LDFLAGS /usr/local/Cellar/libxml2/2.7.7/lib"
CPPFLAGS="$CPPFLAGS /usr/local/Cellar/libxml2/2.7.7/include"

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:/usr/local/bin/ruby-build:$PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export NODE_PATH="/usr/local/lib/node"

export EDITOR='vim'
export JRUBY_OPTS='--1.9'

source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 "(%s)")$ '
export CLICOLOR=1


if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator



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

function log()
{
  > log/development.log
  tail -f -n200 log/development.log
}

eval "$(rbenv init -)"
