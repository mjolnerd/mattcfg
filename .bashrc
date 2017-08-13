

## SET PATH
# This is to prevent duplicates.  I was having an issue with the PATH on my MBP
#  growing with duplicates.
#  Shamelessly stolen from: https://unix.stackexchange.com/questions/110042/how-can-i-clean-out-duplicate-entries-from-my-path
pathmunge () {
        if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}

pathmunge $HOME/local/bin
pathmunge $HOME/bin
pathmunge $HOME/ansible/bin
export PATH

## Aliases go here
# This alias allows control of my dotfiles as a git repo
alias mattcfg='/usr/bin/git --git-dir=$HOME/.mattcfg/ --work-tree=$HOME'
# Pretty colors make listings easier to visually parse
if [ "$(uname -s)" == "Darwin" ]
then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
# Set a long list command
alias l.='ls -d .* --color=auto'
alias ll='ls -lG'

#Set up a nice prompt
## This relies on LiquidPrompt already being installed on the host.
## The mattcfg_install.sh should have handled this.  If not:
## https://github.com/nojhan/liquidprompt.git
#
# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

## Load system specific stuff here
if [ -f ~/.bashrc_specialneeds ]; then
          . ~/.bashrc_specialneeds
        fi
