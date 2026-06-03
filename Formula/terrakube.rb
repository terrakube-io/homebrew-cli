class Terrakube < Formula
  desc "terrakube command line tool"
  homepage "https://docs.terrakube.io/"
  license "Apache-2.0"

  version "1.0.0-beta.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/terrakube-io/terrakube-cli/releases/download/v#{version}/terrakube-v#{version}-darwin-amd64.tar.gz"
      sha256 "1a071b793ddd86b68577857915fd800c9c795a299e1ce32693df116cbe95dd02"
    elsif Hardware::CPU.arm?
      url "https://github.com/terrakube-io/terrakube-cli/releases/download/v#{version}/terrakube-v#{version}-darwin-arm64.tar.gz"
      sha256 "650b35381b5fbc2111b574f3b39da89c68de6e9bf4a5eb97a7bcdba79e4d456c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/terrakube-io/terrakube-cli/releases/download/v#{version}/terrakube-v#{version}-linux-amd64.tar.gz"
      sha256 "5a41c520a115f4e3155ae474688ce674207c9dabd597823be7f4524d7a66e536"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/terrakube-io/terrakube-cli/releases/download/v#{version}/terrakube-v#{version}-linux-arm64.tar.gz"
      sha256 "525b8a69b6c1d8c32dcb24d18ba0783a57b3d637339a6bcb7b39de05b892576e"
    end
  end

  bottle do
    root_url "https://github.com/terrakube-io/homebrew-cli/releases/download/v1.0.0-beta.5"
    sha256 cellar: :any_skip_relocation, big_sur:        "56b67362e10b25ba5368096938c87d408c2a3d9c484358e9cfef1eb2ad68b11a"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6be8bf72b8f00ef159d21062f403c58da49238d9e3cc2e9b2df24f19832dd1ad"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "739f4b134d00942064dde39bc6bb23b009ffeb0313f61f1c24eaf96fb38e7aa4"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7bdb9ab62c6b5aa19c9ee9308ecb56b967159dffbef6e214cb0523a3cbe3b7ad"
  end

  def install
    bin.install "terrakube"
  end

  test do
    system "#{bin}/terrakube", "help"
  end
end
