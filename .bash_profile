# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Local binaries
export PATH="$PATH:/home/nikola/.local/bin"
# Kitty
export PATH="$PATH:/home/nikola/.local/kitty.app/bin"
# JetBrains Toolbox
export PATH="$PATH:/home/nikola/.local/share/JetBrains/Toolbox/apps"
# GraalVM
export PATH="$PATH:/home/nikola/graalvm-ce-java17-22.3.1/bin"
export GRAALVM_HOME="/home/nikola/graalvm-ce-java17-22.3.1"

