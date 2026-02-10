class Terrakube < Formula
    desc "terrakube command line tool"
    homepage "https://docs.terrakube.io/"
    url "https://github.com/terrakube-io/terrakube-cli/releases/download/v1.0.0-beta.2/terrakube-v1.0.0-beta.2-darwin-amd64.tar.gz"
    sha256 "a7463a1b0db4248d8e584f22ab3df9986a5c5ed1b3c92b076451e883031d8df4"
    license "Apache-2.0"
  
  
    def install
      bin.install 'terrakube'
    end
  
  end
  
