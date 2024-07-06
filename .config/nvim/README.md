# Git Repo setup with alias
## Setup on a new Machine

1. Make sure the `config` alias is present in the `.bashrc`

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

2. Make sure git and neovim are installed
3. Create a gitignore in your root and add `.cfg`

```
echo ".cfg" >> .gitignore
```

4. Clone the repo  

```
git clone --bare https://github.com/nikolaDrljaca/dotfiles.git $HOME/.cfg`
```

5. Define the alias for the current shell instance

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

6. You can now CHECKOUT the files into your HOME directory `config checkout`
7. Install deps: `npm(node), cc, gcc, clang, cl, zig`

## Usage

As files are modified you can use the standard `add ...`, `commit`, `push`, `status`.

---
## Neovim config notes
