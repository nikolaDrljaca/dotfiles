# Local binaries
export PATH="$PATH:/home/nikola/.local/bin"
# Local scripts
export PATH="$PATH:$HOME/.local/scripts"
# JetBrains Toolbox
export PATH="$PATH:/home/nikola/.local/share/JetBrains/Toolbox/apps"

if command -v bat &> /dev/null; then
    alias cat='bat -p'
fi
