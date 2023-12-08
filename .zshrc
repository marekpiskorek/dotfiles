# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Custom scripts
#
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
#
# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias v=nvim
alias g=git
alias ls="lsd -lah"

# Custom function for find and replace with ag. Needs to be defined in another way as export does not handle this correctly.
# function agr { ag -0 -l --no-color "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'; }
# export -f agr

# Add the juicy stuff to PATH: npm, cargo, go bins and my custom bin path
export PATH=~/.npm-global/bin:~/.local/bin/:~/.cargo/bin:~/go/bin:~/bin/:$PATH
eval "$(direnv hook zsh)"

# Add autocompletion to taskrunner
autoload bashcompinit
bashcompinit
if [ -f $HOME/co/backend/bin/taskrunner-completion.bash ]; then
  . $HOME/co/backend/bin/taskrunner-completion.bash
fi
export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
