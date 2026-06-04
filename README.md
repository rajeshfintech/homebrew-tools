# rajeshfintech/tools — Homebrew Tap

Personal Homebrew tap with CLI tools for day-to-day developer workflows.

## Install the tap

```bash
brew tap rajeshfintech/tools
```

(`homebrew-` prefix is appended automatically — `rajeshfintech/tools` resolves to this repo.)

---

## Available formulas

### `tab-auto-grouper`

Automatically groups Chrome tabs by URL rules (domain or path prefix).
Config is a human-friendly YAML file — edit it, commit it to git.

```bash
brew install rajeshfintech/tools/tab-auto-grouper
tabgroups install        # one-time Chrome setup per profile
tabgroups config         # edit grouping rules in $EDITOR
tabgroups sync           # apply config changes to the extension
```

Key points:
- Your config lives at `~/.config/tab-auto-grouper/config.yaml` and is **never touched by `brew upgrade`**
- After upgrading, reload the extension in `chrome://extensions` → ↺

→ [Full docs](https://github.com/rajeshfintech/chrome-tab-grouper)

---

## Upgrading

```bash
brew update
brew upgrade tab-auto-grouper
```

## Uninstalling

```bash
brew uninstall tab-auto-grouper
brew untap rajeshfintech/tools      # remove the tap entirely
```
