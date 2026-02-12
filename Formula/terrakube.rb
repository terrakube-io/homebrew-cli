class Terrakube < Formula
    desc "terrakube command line tool"
    homepage "https://docs.terrakube.io/"
    url "https://github.com/terrakube-io/terrakube-cli/releases/download/v1.0.0-beta.3/terrakube-v1.0.0-beta.3-darwin-amd64.tar.gz"
    sha256 "0c548e63c0f2119377fa4131e9cf92249104a9711d92e6c85e91daa6f64ad1c7"
    license "Apache-2.0"
  
  
    def install
      bin.install 'terrakube'
    end
  
  end
  
