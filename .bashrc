

# SET PATH
PATH=$HOME/local/bin:$HOME/bin:$HOME/ansible/bin:$PATH
export PATH

## Aliases go here
# This alias allows control of my dotfiles as a git repo
alias mattcfg='/usr/bin/git --git-dir=$HOME/.mattcfg/ --work-tree=$HOME'
# Set a long list command
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
