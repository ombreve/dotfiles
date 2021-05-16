# Personal dotfiles and scripts

I have a few requirements for my dotfiles and scripts:

- No install script, no symlinks: just edit files *in place*.
- Do not interfere with any other git repositories around.
- Even if my local backup procedure includes only a subtree of my home
  directory, my dotfiles should be part of that backup without any
  extra configuration.

The initial local git repository was therefore created as bare in a
side folder that is part of my backup subtree:

    $ git init --bare $HOME/backup/dotfiles.git
    $ alias dotfiles='git --git-dir=$HOME/backup/dotfiles.git --work-tree=$HOME'
    $ dotfiles config --local status.showUntrackedFiles no

And I just use `dotfiles` instead of `git` for configuration files:

    $ dotfiles add .bashrc
    $ dotfiles commit -m "Add bashrc"
    $ dotfiles push
    # and so on....

## Cloning

To clone in a possibly non-empty home directory:

    $ git clone --separate-git-dir=$HOME/backup/dotfiles.git \
        https://github.com/ombreve/dotfiles.git $HOME/dotfiles-tmp
    $ alias dotfiles='git --git-dir=$HOME/backup/dotfiles.git --work-tree=$HOME'
    $ rm -r $HOME/dotfiles-tmp
    $ dotfiles status
    # checkout or merge individual files...

