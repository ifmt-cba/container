#!/bin/bash

# Nome da sessão tmux
SESSION_NAME="sessao1"

# Cria a sessão tmux
tmux new-session -s "$SESSION_NAME" -d

# Cria janelas e painéis
# Janela 1 com 3 painéis
tmux new-window -t "$SESSION_NAME:1"
tmux split-window -t "$SESSION_NAME:1"
tmux select-pane -t 1
tmux split-window -h -t "$SESSION_NAME:1"

# Janela 2 com 1 painel
tmux new-window -t "$SESSION_NAME:2"

# Envia comandos para os painéis
# Janela 1, Painel 1 (comando que continua executando)
tmux send-keys -t "$SESSION_NAME:1.0" "top" C-m

# Janela 1, Painel 2 (comando que continua executando)
tmux send-keys -t "$SESSION_NAME:1.1" "watch -n 1 df -h" C-m

# Janela 1, Painel 3 (comando que termina)
tmux send-keys -t "$SESSION_NAME:1.2" "ls -l" C-m

# Janela 2, Painel 1 (comando que continua executando)
tmux send-keys -t "$SESSION_NAME:2.0" "netstat -ant" C-m

# Ativa a sessão tmux
tmux attach -t "$SESSION_NAME"
