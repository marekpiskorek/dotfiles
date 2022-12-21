#! /bin/bash

tmux new-session -s work -n neovim \; \
	send-keys 'cd co/backend' C-m \; \
	send-keys 'v' C-m \; \
  split-window -h \; \
  resize-pane -R 50 \; \
  send-keys 'cd co/backend/go/src/samsaradev.io/' C-m \; \
	send-keys 'export EXPERIMENTAL\_TASKRUNNER\_NEWTUI=0' C-m \; \
	new-window -n meta \; \
	send-keys 'cd .config/nvim && v' C-m \; \
  send-keys 'cd co/backend' C-m \; \
  send-keys 'v' C-m \; \
  split-window -h \; \
  send-keys 'v notes/notes.md "+normal G"' C-m \; \
	select-window -t 1 \; \
  select-pane -t 0 \; \
