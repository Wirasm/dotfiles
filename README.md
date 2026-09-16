# dotfiles

My machine config, versioned. The real files live here; `~/.config` points at them
through symlinks, so editing either side edits the same file.

## What's here

| Path | Links to |
|------|----------|
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |
| `agents/AGENTS.md` | `~/.config/zed/AGENTS.md`, `~/.codex/AGENTS.md`, `~/.pi/agent/AGENTS.md` |
| `claude/CLAUDE.md` | `~/.claude/CLAUDE.md` |

## Setup on a new machine

```sh
git clone <this repo> ~/Projects/mine/dotfiles
~/Projects/mine/dotfiles/install.sh
```

`install.sh` backs up anything already in place to `<file>.bak` before linking,
and is safe to re-run.

## Global agent rules

`agents/AGENTS.md` is the single source of truth for how agents should work with me.
Zed's agent reads it from `~/.config/zed/AGENTS.md`, Codex and pi from their own
paths. Edit it once, every agent sees the change.

Claude Code reads `claude/CLAUDE.md` instead, on purpose. The two files started
from the same text and are meant to drift: AGENTS.md stays tool-agnostic, CLAUDE.md
can carry Claude Code specifics. Edit one and the other does not change.

## Note on Zed

Zed canonicalizes the settings path before saving, so changes made from Zed's UI
write through the symlink to the file in this repo instead of replacing the link.
Settings edited in the app show up here as normal git changes.
