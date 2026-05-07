class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "dad1844f57695aabeec255ab335ba986c629d04a3eff6194302305294cd21169"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-x86_64-apple-darwin.tar.gz"
    sha256 "b6f09cf1a442752b2b4e4d1f6fb21bc3642af30e46ad78f964991339d4f5c310"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "91b6d3ca9d30206ac29a3ee5c63947e711df97deabe3b20536c0d30b4315b654"
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
