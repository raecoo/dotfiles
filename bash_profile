#LDFLAGS="$LDFLAGS /usr/local/Cellar/libxml2/2.7.7/lib"
#CPPFLAGS="$CPPFLAGS /usr/local/Cellar/libxml2/2.7.7/include"
#LDFLAGS:  -L/usr/local/opt/libxml2/lib
#CPPFLAGS: -I/usr/local/opt/libxml2/include

export ANDROID_HOME="$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:/usr/local/bin/ruby-build:$PATH"
export PATH="$ANDROID_HOME:$PATH"
export PATH="$PATH:/usr/local/share/npm/bin"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"


export ANDROIDSDK="$HOME/android-sdk"
export ANDROIDNDK="$HOME/android-ndk"
export ANDROIDNDKVER=r8
export ANDROIDAPI=14

export EDITOR='vim'
export JRUBY_OPTS='--1.9'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
  . $(brew --prefix)/etc/bash_completion.d
fi
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 "(%s)")$ '
export CLICOLOR=1

# for Ruby GC
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

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

function postgres_start()
{
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

function postgres_stop()
{
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

function start_dev_processes()
{
  sudo nginx
  mongod run --config /usr/local/etc/mongod.conf
}

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
