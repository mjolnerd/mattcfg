#!/bin/bash

## Your current bashrc needs:
#alias mattcfg='/usr/bin/git --git-dir=$HOME/.mattcfg/ --work-tree=$HOME'
# 
# You'll probably need to log out and back in after running this.

git clone --bare https://github.com/mjolnerd/mattcfg.git $HOME/.mattcfg
function mattcfg {
   /usr/bin/git --git-dir=$HOME/.mattcfg/ --work-tree=$HOME $@
}
mkdir -pv .config-backup
mattcfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mattcfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
mattcfg checkout
mattcfg config status.showUntrackedFiles no

# Install liquidprompt
git clone https://github.com/nojhan/liquidprompt.git $HOME/liquidprompt

