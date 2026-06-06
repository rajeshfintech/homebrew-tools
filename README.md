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

### `auto-tab-closer`

Automatically closes Chrome tabs that have been logged out (AWS, Google, GitHub, etc.).
Detects the redirect to a login page and starts a 10-minute idle timer — focusing the tab
resets the timer; navigating away cancels it.

```bash
brew install rajeshfintech/tools/auto-tab-closer
tabclose install        # one-time Chrome setup per profile
tabclose config         # edit idle_minutes and login-page patterns
tabclose sync           # push config changes to the installed extension
```

Key points:
- Your config lives at `~/.config/auto-tab-closer/config.json` and is **never touched by `brew upgrade`**
- Covers AWS, Google/Gmail, GitHub, Microsoft, LinkedIn, Slack, Okta, GitLab, Atlassian out of the box
- After upgrading, reload the extension in `chrome://extensions` → ↺

→ [Full docs](https://github.com/rajeshfintech/chrome-tab-grouper)

---

## Upgrading

```bash
brew update
brew upgrade tab-auto-grouper
brew upgrade auto-tab-closer
```

## Uninstalling

```bash
brew uninstall tab-auto-grouper
brew uninstall auto-tab-closer
brew untap rajeshfintech/tools      # remove the tap entirely
```
