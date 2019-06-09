# echo is like puts for bash (bash is the program running in your terminal)
echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# PATH to BASH Scripts
export PATH="$HOME/scripts/:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Path for RVM
test -d "$HOME/.rvm/bin" && PATH="$PATH:$HOME/.rvm/bin"

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# Path for RBENV
test -d "$HOME/.rbenv/" && PATH="$HOME/.rbenv/bin:$PATH"

# Path changes are made non-destructive with PATH=new_path;$PATH   This is like A=A+B so we preserve the old path

# Path order matters, putting /usr/local/bin before /usr/bin
# ensures brew programs will be seen and used before another program
# of the same name is called

# Path for brew - TEMPORARILY DISABLED
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku - TEMPORARILY DISABLED
# test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful prompt
# \[\e[0m\] resets the color to default color
ColorReset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
ColorRed='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
ColorGreen='\[\e[0;32m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -s $git_prompt_script ]; then
  # if git-prompt is installed, use it (ie. to install it use:
  # `brew install git`)
  source $git_prompt_script
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="\n$ColorRed\W$ColorReset$(__git_ps1)$ColorReset :> "
else
  # otherwise omit git from the prompt
  export PS1="\n$ColorRed\W$ColorReset :> "
fi

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# Set Sublime as the default editor
export EDITOR="/usr/local/bin/subl"

# Useful aliases

#alias e="subl"
alias be="bundle exec"
PATH="$HOME/.rbenv/shims:$PATH"

# Add path to Scala
PATH="/usr/local/scala/bin:$PATH"

#   ---------------------------
#   Helpful Functions and Aliases
#   ---------------------------

# qfind:    Quickly search for file
#   -----------------------------------------------------
    alias qfind="find . -name "

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

    #   startpsql: start the postgreSQL server
    #   -----------------------------------------------------
    alias startpsql='postgres -D /usr/local/var/postgres &'

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Make GTK+ linking work
PATH=/Library/Frameworks/GTK+.framework/Resources/bin:$PATH
export PATH

# Path to Web Assembly Toolkit (WABT) tools
PATH="~/wabt/build:${PATH}"
export PATH
