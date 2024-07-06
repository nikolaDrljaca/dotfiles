# Dotfiles with `stow`

Layout of this `~/dotfiles/` directory mimics the layout of the home directory.

Meaning, `~/.bashrc` needs to be `~/dotfiles/.bashrc`

## Requirements

Make sure to have `git` and `stow` installed.

## Info
- `stow` will ignore `.git` and this README by default, meaning, they will not be linked to any entries in the parent (in this case home) directories

- You can make changes to the linked files as if they were "the real" ones. This goes both ways. Editing the link and the source effectively creates the same changes.

## Adding a new config

Just create the config structure as it would need to be in the `$HOME/dotfiles` folder and run the `stow .` command INSIDE that directory.

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
