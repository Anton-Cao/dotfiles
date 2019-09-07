set-option -g prefix C-o
unbind-key C-o
bind-key C-o send-prefix
set -g base-index 1

# Easy config reload
bind-key R source-file ~/.tmux.conf \; display-message "tmux.conf reloaded."

# vi is good
setw -g mode-keys vi

# mouse behavior
set -g mouse on

# use vim-like keys for splits and windows
bind-key v split-window -h -c "#{pane_current_path}"
bind-key s split-window -v -c "#{pane_current_path}"
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Status Bar
set-option -g status-interval 1
set -g status-left-length 25
set -g status-left '[#h:#S] '
set-option -g status-right '%l:%M%p'
set-window-option -g window-status-current-fg magenta
set-option -g status-fg default
set-option -g status-bg default
set-option -g pane-active-border-fg default
set-option -g pane-border-fg default

# custom
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"
