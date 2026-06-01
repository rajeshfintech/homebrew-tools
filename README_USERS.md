
# 📘 **README.md — circleci-trigger**

# 🚀 circleci-trigger

A lightweight, secure command-line tool to trigger CircleCI pipelines for internal services — without using CircleCI’s web UI.

This tool is built for teams that frequently deploy new services or components into Kubernetes (K8S) or Infrastructure-as-Code (IAC) repositories and want a fast, scriptable way to trigger CircleCI workflows.

---

# ✨ Features

- Trigger CircleCI pipelines from your terminal
    
- Supports multiple pipelines:
    
    - **IAC pipeline** (`TAG` parameter)
        
    - **K8S deployment pipeline** (`NEW` parameter)
        
- Interactive configuration via `circleci-trigger init`
    
- Reads all sensitive/org-specific details from `~/.circleci-trigger/config.yml`
    
- Homebrew install support
    
- Automatic version upgrades via Homebrew
    
- No secrets stored in repo — safe for public GitHub usage
    
- Requires only one environment variable: `CIRCLECI_TOKEN`
    

---

# 📦 Installation (Homebrew)

`brew tap rajeshfintech/homebrew brew install circleci-trigger`

To upgrade:

`brew upgrade circleci-trigger`

To check installed version:

`circleci-trigger --version`

---

# 🔧 Initial Setup (Required)

Before using the CLI, run:

`circleci-trigger init`

This wizard will ask you for:

- CircleCI token environment variable name
    
- Your CircleCI VCS provider (`bitbucket`, `github`)
    
- Your organization
    
- IAC repo name
    
- K8S repo name
    

Example session:

`$ circleci-trigger init  Token env [CIRCLECI_TOKEN]: Org: instadevelopers VCS: bitbucket IAC repo: n1-iac K8S repo: n1-k8s  Saved: /Users/<you>/.circleci-trigger/config.yml`

This creates:

`~/.circleci-trigger/config.yml`

with all organization-specific details.

---

# 🔐 Authentication

Export your CircleCI API token:

`export CIRCLECI_TOKEN="your-token-here"`

The CLI will read this automatically.
---

# 🔄 Automatic Updates & Versioning

- The CLI is distributed via Homebrew.
    
- GitHub Actions automatically:
    
    - extracts version from git tags (ex: `v0.3.0`)
        
    - builds Python package
        
    - uploads release tarball
        
    - updates Homebrew tap formula
        
- Users update via:
    

`brew upgrade circleci-trigger`

No manual steps required.

---

# 🧪 Troubleshooting

### ❌ “Missing CircleCI token”

Run:

`export CIRCLECI_TOKEN="your-token"`

Ensure it matches value in:

`~/.circleci-trigger/config.yml`

### ❌ “Run: circleci-trigger init”

You must initialize the tool before use:

`circleci-trigger init`

### ❌ “Pipeline returns 400/403”

Check that:

- Your CircleCI token has permission
    
- The repo names in your config are correct
    
- The project exists in CircleCI under your org
    

### ❌ Homebrew formula not updated

Push a patch release tag:

`git tag v0.3.1 git push origin v0.3.1`

The pipeline will rebuild and fix the tap.

---

# 🌟 Contributing

PRs are welcome!  
This tool is intentionally minimal and modular — feel free to add:

- pipeline log viewing
    
- rerun last workflow
    
- trigger multiple services at once
    
- YAML presets
    
- service discovery
    
- kubectl integrations
    

---

# 📜 License

MIT License.

---
