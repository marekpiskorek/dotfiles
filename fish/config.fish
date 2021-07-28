# ALIASES
alias k=kubectl
alias g=git
alias vim=~/bin/appimages/nvim.appimage
alias ls="lsd -la"
alias run-codility="~/workspace/codility/run django:port=8001 backend-worker webpack-dev-server task-server checker docker_server"

# Add GOPATH
set -x -U GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# Run tmux on shell start
if ! test $TERM = screen-256color
  exec tmux new-session -A -s main 
end
