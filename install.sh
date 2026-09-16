#!/bin/sh
# Link the configs in this repo into place. Safe to re-run.
set -e

repo=$(cd "$(dirname "$0")" && pwd)

link() {
    src="$repo/$1"
    dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "ok      $dest"
        return
    fi
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        mv "$dest" "$dest.bak"
        echo "backup  $dest -> $dest.bak"
    fi
    ln -s "$src" "$dest"
    echo "linked  $dest"
}

link zed/settings.json "$HOME/.config/zed/settings.json"
link zed/keymap.json "$HOME/.config/zed/keymap.json"

# One set of global agent rules, read by Zed's agent, Codex and pi.
link agents/AGENTS.md "$HOME/.config/zed/AGENTS.md"
link agents/AGENTS.md "$HOME/.codex/AGENTS.md"
link agents/AGENTS.md "$HOME/.pi/agent/AGENTS.md"

# Claude Code reads its own file, kept deliberately separate from AGENTS.md.
link claude/CLAUDE.md "$HOME/.claude/CLAUDE.md"
