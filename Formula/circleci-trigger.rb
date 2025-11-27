class CircleciTrigger < Formula
  include Language::Python::Virtualenv

  desc "CircleCI trigger CLI"
  homepage "https://github.com/rajeshfintech/circleci-trigger"
  url "https://github.com/rajeshfintech/circleci-trigger/releases/download/v0.2.0/circleci_trigger-0.2.0.tar.gz"
  sha256 "6c3bcc8c0b9f44499e7cbee7a0c3983175b21cb348100dcdc3b4abdedb8aae59"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/circleci-trigger", "--help"
  end
end
