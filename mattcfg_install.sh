#!/bin/bash

## Your current bash session needs:
#alias mattcfg='/usr/bin/git --git-dir=$HOME/.mattcfg/ --work-tree=$HOME'
#
# Do not name this file 'mattcfg_install.sh' or it will conflict with the
#  git checkout.  You might also want to move the current bashrc out of
#  the way as well.
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
    mattcfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv -v {} .config-backup/{}
fi;
mattcfg checkout
mattcfg config status.showUntrackedFiles no

# Install liquidprompt
git clone https://github.com/nojhan/liquidprompt.git $HOME/liquidprompt

# vim configuration
mkdir -pv ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# grab our pathogen plugins
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/Yggdroot/indentLine.git
