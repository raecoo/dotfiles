LDFLAGS="$LDFLAGS /usr/local/Cellar/libxml2/2.7.7/lib"
CPPFLAGS="$CPPFLAGS /usr/local/Cellar/libxml2/2.7.7/include"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

export EDITOR='mate -w'
export JRUBY_OPTS='--1.9'

source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\h:\w$(__git_ps1 " (%s)")$ '
export CLICOLOR=1


if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
  
function svim()
{
  (rvm system; unset GEM_PATH GEM_HOME; command mvim "$@")
}

function parse_git_branch() {
  RSLT=''
  GIT_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* //'` 
  if [ "$GIT_BRANCH" ]
  then
    GIT_STATUS=`git status 2> /dev/null | grep 'working directory clean'`
    CLR='2'
    if [ "$GIT_STATUS" ]
    then
      CLR='2'
    else
      CLR='1'
    fi
    RSLT="[3${CLR};40m(${GIT_BRANCH})[0m"
  fi
  echo $RSLT
}

YELLOW="\[\033[0;33m\]" 
GREEN="\[\033[0;32m\]" 

PS1="\w$YELLOW\$(parse_git_branch)$"