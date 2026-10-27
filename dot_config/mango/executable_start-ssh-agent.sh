#!/bin/sh
SOCKET="$HOME/.ssh/agent/ssh-agent.sock"

# Check if an agent is already responding on the socket
if [ -S "$SOCKET" ] && SSH_AUTH_SOCK="$SOCKET" ssh-add -l >/dev/null 2>&1; then
    # Agent is alive and responding, just set the variable
    export SSH_AUTH_SOCK="$SOCKET"
else
    # No live agent, clean up and start a new one
    rm -f "$SOCKET"
    eval "$(ssh-agent -a "$SOCKET")"
fi
