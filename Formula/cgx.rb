class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.3.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.1/cgx-v0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "3ee92887f4ebd1d36a87b93533cb537602e22c2a0788c3cf400686ad139b15d0"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.1/cgx-v0.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "5faf61eede8e8ea03b9a6584c6a192ebaf2dbca5212e0059fc82e45223d7aec4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.1/cgx-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1727b6c33a86342bdb49c302da8de943fa96a54d42b3e8575947ff9aaeaa249f"
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
