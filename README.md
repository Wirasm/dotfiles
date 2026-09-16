# dotfiles

My machine config, versioned. The real files live here; `~/.config` points at them
through symlinks, so editing either side edits the same file.

## What's here

| Path | Links to |
|------|----------|
| `zed/settings.json` | `~/.config/zed/settings.json` |
| `zed/keymap.json` | `~/.config/zed/keymap.json` |

## Setup on a new machine

```sh
git clone <this repo> ~/Projects/mine/dotfiles
~/Projects/mine/dotfiles/install.sh
```

`install.sh` backs up anything already in place to `<file>.bak` before linking,
and is safe to re-run.

## Note on Zed

Zed canonicalizes the settings path before saving, so changes made from Zed's UI
write through the symlink to the file in this repo instead of replacing the link.
Settings edited in the app show up here as normal git changes.
