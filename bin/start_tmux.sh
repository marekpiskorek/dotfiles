#! /bin/bash

tmux new-session -s work -n notes \; \
	send-keys 'cd Documents/personal-notes/unemployment_feb_26/' C-m \; \
    send-keys 'v daily.md "+normal G"' C-m \; \
  new-window -n nvim \; \
    send-keys 'cd codes/client-server/' C-m \; \
	send-keys 'v "+normal :Neotree"' C-m \; \
  new-window -n runners \; \
    send-keys 'cd codes/client-server/server' C-m \; \
    send-keys 'PORT=8000 go run ./cmd/' C-m \; \
    split-window -h \; \
    send-keys 'cd codes/client-server' C-m \; \
    select-pane -t 0 \; \
    split-window \; \
    send-keys 'cd codes/client-server/client' C-m \; \
  new-window -n claude \; \
    send-keys 'cd codes/client-server/' C-m \; \
	send-keys 'claude' C-m \; \
select-window -t 1 \; \
