class TabAutoGrouper < Formula
  include Language::Python::Virtualenv

  desc "Automatically group Chrome tabs by URL rules — CLI + unpacked extension"
  homepage "https://github.com/rajeshfintech/chrome-extensions"
  url "https://github.com/rajeshfintech/chrome-extensions/archive/refs/tags/tab-auto-grouper-v1.1.7.tar.gz"
  sha256 "82317d28d3cbbc7fb416f8ef87fd9811b66d847f93c40857e451f8a21f2414c3"
  license "MIT"

  depends_on "python@3.12"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    # Create a virtualenv and install PyYAML into it
    venv = virtualenv_create(libexec/"venv", "python3.12")
    venv.pip_install resources

    cd "tab-auto-grouper" do
      libexec.install "cli.py", "config.yaml", "extension"
    end

    # Wrapper: invokes cli.py via the venv's Python so PyYAML is importable.
    (bin/"tabgroups").write <<~BASH
      #!/bin/bash
      exec "#{libexec}/venv/bin/python3" "#{libexec}/cli.py" "$@"
    BASH
    chmod 0755, bin/"tabgroups"
  end

  def caveats
    <<~EOS
      Your personal config is stored at:
        ~/.config/tab-auto-grouper/config.yaml

      It is created from the default template on first run and is NEVER
      modified by brew upgrade or brew reinstall — your rules are safe.

      First-time setup:
        tabgroups install        # installs the Chrome extension for all profiles
        tabgroups config         # edit your grouping rules
        tabgroups sync           # apply config changes to the extension

      After brew upgrade, reload the extension in Chrome:
        chrome://extensions  →  Tab Auto Grouper  →  reload icon (↺)
    EOS
  end

  test do
    system bin/"tabgroups", "--help"
  end
end
