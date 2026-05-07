class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.2"
  license "MIT"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "11fdeeff3bbb29a08976b78b3436df7f3ec81bb0abcc1139a989f3e1cf2b9406"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "d486a3b14dc13bee765dc3286192e99f6360e723f67d7ae08931ff15e6f0a94a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "35e3abab43102e2b5343cdf45b08c2d5cbacca699b15c07230df8e9b41194163"
  end
  def install
    bin.install "cgx"
    pkgshare.install "web-ui" if File.directory?("web-ui")
  end
  def caveats
    <<~EOS
      cgx has been installed!
      Quick start:
        cd your-project
        cgx analyze
        cgx view --web
      For AI editor integration:
        cgx setup
      To check your installation:
        cgx doctor
    EOS
  end
  test do
    system "#{bin}/cgx", "--version"
  end
end
