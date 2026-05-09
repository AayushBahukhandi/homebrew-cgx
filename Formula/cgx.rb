class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.2.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.1/cgx-v0.2.1-aarch64-apple-darwin.tar.gz"
    sha256 "c4a53285d65af95f9cd8af3980887c8674cf88322879ff1f65f5273b9f182ca7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.1/cgx-v0.2.1-x86_64-apple-darwin.tar.gz"
    sha256 "dceb5b306c11a76c44897e2683fe8dc09163a861d314374eb27cfd0740e357cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.1/cgx-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e68dfaaf343838433ff04dc1d7436f84adfb6bdde072018e0460950fd42a118a"
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
