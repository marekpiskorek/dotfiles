#! /bin/bash
# Should be only used as a reference on how to initialize Tmux
# As I don't believe Samsara's environment variables will be useful
# ever again for me.

tmux new-session -s work -n neovim \; \
	send-keys 'cd co/backend' C-m \; \
  send-keys 'v' C-m \; \
  new-window -n shell \; \
  send-keys 'cd co/backend/go/src/samsaradev.io/' C-m \; \
	send-keys 'export EXPERIMENTAL\_TASKRUNNER\_NEWTUI=0' C-m \; \
	new-window -n notes \; \
  send-keys 'v notes/notes.md "+normal G"' C-m \; \
	select-window -t 1 \; \
