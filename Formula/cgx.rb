class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.9/cgx-v0.1.9-aarch64-apple-darwin.tar.gz"
    sha256 "0175e48850d954c8ddb25cf3350c9953677da11b5ab7684e386cdc311ed5eabe"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.9/cgx-v0.1.9-x86_64-apple-darwin.tar.gz"
    sha256 "999c033548fd9ee17a2ef26863c3e74126d4047700e6d859ef26cc00625d2b29"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.9/cgx-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8ec844369e0a2b3d64f1bd58e125c83b2a6811af7643e85a8cb548acfa4b571e"
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
