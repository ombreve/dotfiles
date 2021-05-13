# My Configuration Files

Initially I created a Git bare repository in a side folder instead
of the usual .git local folder, which would interfere with any other Git
repositories around:

    $ git init --bare $HOME/.myconfig
    $ alias dotfiles='git --git-dir=$HOME/.myconfig --work-tree=$HOME'
    $ dotfiles config --local status.showUntrackedFiles no
    $ dotfiles add .bashrc
    $ dotfiles commit -m "Add bashrc"
    $ dotfiles push
    # and so on....

To clone in a possibly non-empty home directory:

    $ git clone --separate-git-dir=$HOME/.myconfig \
        https://github.com/ombreve/dotfiles.git $HOME/dotfiles-tmp
    $ alias dotfiles='git --git-dir=$HOME/.myconfig --work-tree=$HOME'
    $ rm -r $HOME/dotfiles-tmp
    $ dotfiles status
    # And checkout or merge individual files...

