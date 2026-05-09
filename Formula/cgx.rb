class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.0/cgx-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "b2b1802582eac2562d760669f4b605a4673857200740c4d752c1bde7aa3564c6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.0/cgx-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "29f53730a6ba6e4dbcce9e7a1f98fa6d0035a2f48bf4c5ca9d153ad55a7bb913"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.2.0/cgx-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00377a458c2b8a11c64f995c7efce9d7f7d2b959bf44a00e054729d15e6f09ab"
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
