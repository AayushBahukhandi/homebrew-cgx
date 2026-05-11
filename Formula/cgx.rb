class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.3.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.2/cgx-v0.3.2-aarch64-apple-darwin.tar.gz"
    sha256 "0b29849cc6491f6b14f63d049506cc3b9df7e18f375ad79ca1af7bcd20dd5447"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.2/cgx-v0.3.2-x86_64-apple-darwin.tar.gz"
    sha256 "25c93b7fda2b9de5e92e0108db97af21d3ecec95dac336c2608f5ee26e4e7a25"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.2/cgx-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "242376d7098643a66400f8bfb526bfc076a974461513861d2490bb6d6c4c0b1d"
  end

  def install
    bin.install "cgx"
    pkgshare.install "web-ui"
  end

  def caveats
    <<~EOS
      cgx has been installed.

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
