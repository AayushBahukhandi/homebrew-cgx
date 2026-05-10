class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.0/cgx-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "40c213a18cbb8746f88c0c8a920f8d9d010542626895fe79afc8d85cecbd52a5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.0/cgx-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "6b2058ef8818eb0fc12e494e768b14e2b9b431a96ded0e31118cdee0e8cb9835"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.0/cgx-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "608dbb35963ae040a21224e432526fe33b025b21d2cd686e437e6862c462f52f"
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
