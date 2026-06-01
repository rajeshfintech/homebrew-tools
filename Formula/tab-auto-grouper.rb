class TabAutoGrouper < Formula
  include Language::Python::Virtualenv

  desc "Automatically group Chrome tabs by URL rules — CLI + unpacked extension"
  homepage "https://github.com/rajeshfintech/chrome-tab-grouper"
  # Update url and sha256 after creating the first GitHub release:
  #   git tag v1.0.0 && git push origin v1.0.0
  #   curl -sL https://github.com/rajeshfintech/chrome-tab-grouper/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
  url "https://github.com/rajeshfintech/chrome-tab-grouper/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "9c5e9e97da9823cfefd68691c6369dd1f4ad772c68bb6b29e96d0d6504e33cbd"
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

    # Install the CLI and extension template.
    # cli.py uses __file__ to locate config.yaml and extension/ at runtime,
    # so they must all live together in libexec.
    libexec.install "cli.py", "config.yaml", "extension"

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
