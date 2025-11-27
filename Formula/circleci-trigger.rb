class CircleciTrigger < Formula
  include Language::Python::Virtualenv

  desc "CircleCI trigger CLI"
  homepage "https://github.com/rajeshfintech/circleci-trigger"
  url "https://github.com/rajeshfintech/circleci-trigger/releases/download/v0.2.2/circleci_trigger-0.2.2.tar.gz"
  sha256 "396beebc748ada053d63a0783d0d21dcf045c3ac34c4439afdbfe4c2bc016080"
  license "MIT"

  depends_on "python@3.12"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/circleci-trigger", "--help"
  end
end
