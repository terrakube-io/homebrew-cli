class Terrakube < Formula
    desc "terrakube command line tool"
    homepage "https://docs.terrakube.io/"
    url "https://github.com/terrakube-io/terrakube-cli/releases/download/v1.0.0-beta.5/terrakube-v1.0.0-beta.5-darwin-amd64.tar.gz"
    sha256 "1a071b793ddd86b68577857915fd800c9c795a299e1ce32693df116cbe95dd02"
    license "Apache-2.0"
  
  
    def install
      bin.install 'terrakube'
    end
  
  end
  
