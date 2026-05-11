class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.3.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.3/cgx-v0.3.3-aarch64-apple-darwin.tar.gz"
    sha256 "ffd3de9f73867d63c26d499e6a9af5a506880f41c998b6ebf34b4d4a648afb8e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.3/cgx-v0.3.3-x86_64-apple-darwin.tar.gz"
    sha256 "aaf22d966b86e4adfb0c401c8754422fe0733155aa6ebfd3e1ca4a1427018e49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.3.3/cgx-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9920aa1ffb48a764f3bb0f90f57743471cc10f447b06b03c44c8c78e767680a1"
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
