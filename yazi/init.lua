require("full-border"):setup()
require("git"):setup { order = 1500 }

local pref_by_location = require("pref-by-location")
pref_by_location:setup {
  -- `location` is a Lua PATTERN (not a glob); first match wins.
  -- Edit/extend to taste. Example: newest-first Downloads, hidden shown in a dotfiles dir.
  prefs = {
    { location = ".*/Downloads", sort = { "mtime", reverse = true, dir_first = true }, linemode = "mtime" },
  },
}
