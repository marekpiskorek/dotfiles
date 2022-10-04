#! /bin/bash

tmux new-session -s work -n neovim \; \
	send-keys 'cd co/backend && v' C-m \; \
	new-window -n taskrunner \; \
	send-keys 'cd co/backend' C-m \; \
	send-keys 'export EXPERIMENTAL\_TASKRUNNER\_NEWTUI=0' C-m \; \
	send-keys 'taskrunner frontend/only' C-m \; \
	new-window -n shell \; \
	send-keys 'cd co/backend' C-m \; \
	new-window -n config \; \
	send-keys 'cd .config/nvim && v' C-m \; \
	select-window -t 1 \; \
