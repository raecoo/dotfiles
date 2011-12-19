LDFLAGS="$LDFLAGS /usr/local/Cellar/libxml2/2.7.7/lib"
CPPFLAGS="$CPPFLAGS /usr/local/Cellar/libxml2/2.7.7/include"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

export EDITOR='mate -w'
export JRUBY_OPTS='--1.9'

source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\h:\w$(__git_ps1 "(%s)")$ '
export CLICOLOR=1


if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

function svim()
{
  (rvm system; unset GEM_PATH GEM_HOME; command mvim "$@")
}

function ci
{
  git ci -a -m "$@"
}

function gco
{
  git co "$@"
}

function log
{
  > log/development.log
  tail -f -n200 log/development.log
}
