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

# The whole config dir, not the files inside it: Zed watches ~/.config/zed for
# changes, and an edit to a symlinked file inside a real dir fires no event
# there, so live reload silently stops working. zed/AGENTS.md is a relative
# link to agents/AGENTS.md, so Zed's personal instructions come along with it.
link zed "$HOME/.config/zed"

# The same global agent rules for the other tools.
link agents/AGENTS.md "$HOME/.codex/AGENTS.md"
link agents/AGENTS.md "$HOME/.pi/agent/AGENTS.md"

# Claude Code reads its own file, kept deliberately separate from AGENTS.md.
link claude/CLAUDE.md "$HOME/.claude/CLAUDE.md"
