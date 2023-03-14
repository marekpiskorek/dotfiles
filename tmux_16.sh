#! /bin/bash

tmux new-session -s work -n neovim \; \
	send-keys 'cd co/backend' C-m \; \
  send-keys 'v' C-m \; \
  new-window -n shell \; \
  send-keys 'cd co/backend' C-m \; \
	send-keys 'export EXPERIMENTAL\_TASKRUNNER\_NEWTUI=0' C-m \; \
  new-window -n taskrunner \; \
  send-keys 'cd co/backend/go/src/samsaradev.io/' C-m \; \
	send-keys 'export EXPERIMENTAL\_TASKRUNNER\_NEWTUI=0' C-m \; \
	new-window -n notes \; \
  send-keys 'v notes/notes.md "+normal G"' C-m \; \
	select-window -t 1 \; \
