class AutoTabCloser < Formula
  desc "Automatically closes logged-out Chrome tabs (AWS, Google, GitHub, etc.) after idle time"
  homepage "https://github.com/rajeshfintech/chrome-extensions"
  url "https://github.com/rajeshfintech/chrome-extensions/archive/refs/tags/auto-tab-closer-v1.1.0.tar.gz"
  sha256 "e862c3c4012b6fd6780460adb7ee2606af1cc45562cdc3725b36761c019a9481"
  license "MIT"

  depends_on "python@3.12"

  def install
    cd "auto-tab-closer" do
      libexec.install "cli.py", "extension"
    end
    python = Formula["python@3.12"].opt_bin/"python3.12"
    (bin/"tabclose").write <<~BASH
      #!/bin/bash
      exec "#{python}" "#{libexec}/cli.py" "$@"
    BASH
    chmod 0755, bin/"tabclose"
  end

  def caveats
    <<~EOS
      Your personal config is stored at:
        ~/.config/auto-tab-closer/config.json

      It is created from the bundled default on first run and is NEVER
      modified by brew upgrade or brew reinstall — your customisations are safe.

      First-time setup:
        tabclose install        # installs the Chrome extension for all profiles
        tabclose config         # edit idle_minutes and login-page patterns
        tabclose sync           # push config changes to the installed extension

      After brew upgrade, reload the extension in Chrome:
        chrome://extensions  →  Auto Tab Closer  →  reload icon (↺)

      How it works:
        When a tab lands on a recognised login page (AWS, Google, GitHub, etc.)
        a 10-minute idle timer starts. Focusing the tab resets the timer.
        Navigating away (e.g. after re-logging in) cancels it entirely.

        You can also watch any link manually from the toolbar popup
        ("+ Watch current tab" or type a URL pattern) — matching tabs are
        closed after the same idle timeout.
    EOS
  end

  test do
    system bin/"tabclose", "--help"
  end
end
