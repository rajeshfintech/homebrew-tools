class CircleciTrigger < Formula
  include Language::Python::Virtualenv

  desc "CLI to trigger CircleCI pipelines for n1-iac and n1-k8s"
  homepage "https://github.com/rajeshfintech/circleci-trigger"
  url "https://github.com/rajeshfintech/circleci-trigger/releases/download/v0.1.0/circleci_trigger-0.1.0.tar.gz"
  sha256 "b4a541c913ab235e8f141880ccfefff0b6145202d770ad6f63e22a2e2fccbc1f"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "{bin}/circleci-trigger", "--help"
  end
end
