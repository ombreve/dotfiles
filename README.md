# Personal dotfiles

I have a few requirements for my dotfiles and scripts:

- No install script, no symlinks: just edit files *in place*.
- Do not interfere with any other git repositories around.

The initial local git repository was therefore created as bare
under `$DOTFILESDIR`:

    $ export DOTFILESDIR=$HOME/Documents/Atelier/comp/dotfiles.git
    $ git init --bare $DOTFILESDIR
    $ alias dots='git --git-dir=$DOTFILESDIR --work-tree=$HOME'
    $ dots config --local status.showUntrackedFiles no

And I just use `dots` instead of `git` for configuration files:

    $ dots add .bashrc
    $ dots commit -m "Add bashrc"
    $ dots push
    # and so on....

## Cloning

To clone in a possibly non-empty home directory:

    $ export DOTFILESDIR=$HOME/Documents/Atelier/comp/dotfiles.git
    $ git clone --separate-git-dir=$DOTFILESDIR \
        https://github.com/ombreve/dotfiles.git $HOME/dotfiles-tmp
    $ alias dots='git --git-dir=$DOTFILESDIR --work-tree=$HOME'
    $ rm -r $HOME/dotfiles-tmp
    $ dots status
    # checkout or merge individual files...

