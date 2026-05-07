class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "ede6ed1644da820eeb20ac7baaaeefcbd4d5177b96c55a1bc96dfc0480d1f338"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-x86_64-apple-darwin.tar.gz"
    sha256 "da4ea4b4b53f23b55f4a3b2551a2975a33634c431e1257b15b957c0998ec34a0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.5/cgx-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f243911e3d039088a9a2dec1100de454c10b45ecbaa068019359a5c79bbb52d2"
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
