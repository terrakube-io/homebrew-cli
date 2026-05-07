class Terrakube < Formula
    desc "terrakube command line tool"
    homepage "https://docs.terrakube.io/"
    url "https://github.com/terrakube-io/terrakube-cli/releases/download/v1.0.0-beta.4/terrakube-v1.0.0-beta.4-darwin-amd64.tar.gz"
    sha256 "a55d574d65ead3f21130866931c507aeac2a458211a1a0d5d479f4d2dc83fab7"
    license "Apache-2.0"
  
  
    def install
      bin.install 'terrakube'
    end
  
  end
  
