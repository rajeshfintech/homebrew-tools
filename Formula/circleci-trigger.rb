class CircleciTrigger < Formula
  include Language::Python::Virtualenv

  desc "CircleCI trigger CLI"
  homepage "https://github.com/rajeshfintech/circleci-trigger"
  url "https://github.com/rajeshfintech/circleci-trigger/releases/download/v0.2.1/circleci_trigger-0.2.1.tar.gz"
  sha256 "33b2dee7afdb47f1fa5525df48a393040db0ded385219602d7e6d558fa1b9cc0"
  license "MIT"

  depends_on "python@3.12"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/95/45/ba8fb6a0e8e5a0d28abc89c6f0ca6c58410820cb38faae5f68539f3e41c0/PyYAML-6.0.2.tar.gz"
    sha256 "2e4c0f6e38b1d34cbb7a4ca93782bb2b5005fd464729725dcf2d44c3a37f0e6f"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/90/8e/33cb83bdbfaa9a90bf34e66b4a79e927651c01fb9b31c8ed6dfa8185728a/requests-2.32.3.tar.gz"
    sha256 "68d7dedbb5c1e5c23bf3a4dd63ee39073d28a3fcc594a5a2175b4832c75b7f03"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/circleci-trigger", "--help"
  end
end
