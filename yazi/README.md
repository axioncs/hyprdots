# Yazi — Detailed Usage Guide

Personal config for Yazi 26.5.6 on Arch Linux (Wayland).

Plugins installed: `smart-enter`, `smart-paste`, `pref-by-location`, `full-border`, `git`, `chmod`, `diff`, `what-size`.

---

## 1 · Launching

Run `yazi` in a terminal (Kitty). It opens in the **current directory**.

| Key | Action |
|-----|--------|
| `q` | Quit. If a process is running, press `q` again or `ctrl+c`. |
| `yazi <path>` | Open directly in a given directory. |

> Open a file in your editor from the shell: `l` on a file launches it via the system opener.

---

## 2 · Navigation (the core)

| Key | Action |
|-----|--------|
| `h` | Go to **parent** directory |
| `l` | **smart-enter**: enter directory OR open file — one key does both (plugin) |
| `j` / `k` | Move down / up the file list |
| `ctrl+d` / `ctrl+u` | Half-page down / up |
| `gg` / `G` | Top / bottom of list |
| `space` | Toggle **select** the hovered file (selection persists across directories) |
| `v` | Select / deselect a range |
| `ctrl+a` | Select all |
| `z` | **fzf** jump — fuzzy-find any path and teleport there |

### Tabs

| Key | Action |
|-----|--------|
| `t` | New tab |
| `1`–`9` | Switch to tab N |
| `T` | Close tab |
| `[` / `]` | Previous / next tab |

---

## 3 · File operations

| Key | Action |
|-----|--------|
| `a` | Create new file/dir (prompt) |
| `r` | Rename (or bulk rename selected) |
| `d` | **Trash** the hovered/selected (works as solo key — not shadowed) |
| `D` | **Delete** permanently (no trash) |
| `x` | Cut (to clipboard for move) |
| `y` | Copy (to clipboard) |
| `p` | **smart-paste**: paste into the **hovered dir**, or CWD if hovered is a file (plugin) |
| `c m` | **chmod** selected files (plugin — prompts for mode) |
| `e f` | **diff**: diff the selected file against the hovered file → living patch to clipboard |
| `e s` | **what-size**: total size of current selection, or CWD if nothing selected (plugin) |

> ⚠️ **Chord-shadowing note:** a key bound *both* as a solo action and as a chord leader gets promoted to a chord leader, silently killing the solo binding. `d` is solo (trash) — keep it that way. `e` is a free prefix used for `e z`/`e t`/`e m`/`e f`/`e s`. `what-size` was moved from `. s` to `e s` precisely because `.` is a solo action (hidden toggle) and `. s` shadowed it.

---

## 4 · Preview pane

Hover a file → preview shows on the right. Images, PDFs, archives, media metadata, and (with plugins) CSV/Parquet/JSON previews render here.

| Key | Action |
|-----|--------|
| `b` | Toggle preview pane |
| `ctrl+o` | Maximize preview |

> `zoom.yazi` is **not** installed — no preview zoom.

---

## 5 · Search · filter · sort

| Key | Action |
|-----|--------|
| `f` | **Filter** — type to narrow the list live (substring) |
| `s` / `S` | Search with **fd** (files) / **rg** (file contents) |
| `,` | **Sort** chord — see below |

### Sort chord (`,`)

| Chord | Sort |
|-------|------|
| `, m` | mtime |
| `, a` | alphabetical |
| `, e` | extension |
| `, n` | natural |
| `, s` | size |
| `, b` | basename |

| Key | Action |
|-----|--------|
| `, r` | Toggle **reverse** sort |
| `, d` | Toggle **dir-first** |
| `.` | Toggle **hidden files** (pref-by-location remembers it per folder) |

---

## 6 · Your custom `e` chords

Open the **CURRENT directory** (`$PWD`) in external apps, then fork Yazi so it doesn't block.

| Key | Action |
|-----|--------|
| `e z` | Open current dir in **Zed** |
| `e t` | Open current dir in **Kitty** (`kitty --directory "$PWD"`) |
| `e m` | Open current dir in **mpv** |
| `e f` | diff (see §3) |
| `e s` | what-size (see §3) |

> These open the directory you're *in*, not the hovered file. `e` is your chord prefix; `d` remains solo = trash.

---

## 7 · Git awareness (git plugin)

Inside any git repo, the file list shows a **git status linemode** (M/U/A/etc. markers) automatically — no key needed.

| Key | Action |
|-----|--------|
| `m m` | Set linemode to **mtime** (remembered per folder via pref-by-location) |

---

## 8 · pref-by-location (per-folder memory)

Once you change sort / hidden / linemode in a folder, it's remembered and restored next time you enter that folder.

| Key | Action |
|-----|--------|
| `, t` | Toggle auto-save on/off |
| `, d` | Disable auto-save (stop remembering this folder) |
| `, R` | Reset this folder's saved preference |

> Preset in `init.lua`: **Downloads** → sorted newest-first (mtime reverse), dirs first, mtime linemode. Add more in `init.lua`. `location` is a Lua regex, not a glob.
> State persists to `~/.config/yazi/pref-by-location/`.

---

## 9 · Shell commands from inside Yazi

| Key | Action |
|-----|--------|
| `;` or `:` | Open a shell prompt; runs in the **current directory** (`$PWD` is Yazi's cwd) |

Example: `; rg "TODO"` runs ripgrep in the folder you're viewing. Open a real shell there: `; $SHELL` or your `e t` to launch Kitty.

---

## 10 · Appearance (full-border plugin)

Adds a full border around the whole UI for a cleaner, framed look. Pure cosmetic, always on (registered in `init.lua`).

---

## 11 · Opener (opener.toml) — route file types to apps

Yazi has its **own** opener (independent of `xdg-mime`). To add an app to the open menu (incl. **Shift+Enter** picker), register a named opener + a routing rule.

```toml
# Named opener
[opener]
zen = [ { run = 'zen-browser "$@"', desc = "Open in Zen", orphan = true } ]

# Route by extension (use prepend_rules to win over defaults)
[open]
prepend_rules = [
  { url = "*.html",  use = "zen" },
  { url = "*.htm",   use = "zen" },
  { url = "*.xhtml", use = "zen" },
]
```

- `run` = returns immediately (GUI apps). `spawn` = takes over terminal until exit (TUI apps like `nvim`).
- `$@` = the file path(s). Always quote it.
- After editing: `yazi --clear-cache`.
- ⚠️ The schema is **NOT** `[[opener.rules]]` with `mime =`. That form is silently ignored. Use the `[opener]` + `[open] prepend_rules` form above (verified against Yazi 26.5.6).
- To open an unknown type via the system default, add an `xdg-open` opener and a `* ` rule.

---

## 12 · Config file map (`~/.config/yazi/`)

| File | Purpose |
|------|---------|
| `keymap.toml` | All keybindings (your `e` chords + plugin binds) |
| `yazi.toml` | Global options + git fetcher |
| `init.lua` | Plugin setup (full-border, git, pref-by-location presets) |
| `opener.toml` | File-type → app routing |
| `package.toml` | Installed plugins (managed by `ya pkg` — don't hand-edit) |
| `plugins/` | Actual plugin code (managed by `ya pkg`) |
| `pref-by-location/` | Per-folder saved preferences (plugin state) |

> After **any** Yazi upgrade: run `ya pkg upgrade` to keep plugins on the matching version (plugins track Yazi HEAD). If `ya pkg upgrade` aborts with "You have modified the contents of the `<plugin>` plugin", run `ya pkg upgrade --discard`.

---

## 13 · Quick daily flow

1. `yazi` → `z` to jump anywhere.
2. `l` to open/enter, `space` to select multiple, `y` copy, `h` up, `p` paste into target.
3. `e z` to open the current project in Zed, `e t` for a Kitty there.
4. In a git repo, watch the status column; `, m` to sort by mtime when needed.
5. `.` to toggle hidden files. `d` to trash, `q` to quit.
