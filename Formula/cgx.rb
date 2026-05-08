class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.7/cgx-v0.1.7-aarch64-apple-darwin.tar.gz"
    sha256 "28521abfebe9b3c4f1db9f189cd029683da5b053326167e2d8423e8bb77f659b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.7/cgx-v0.1.7-x86_64-apple-darwin.tar.gz"
    sha256 "7e819f06065f6cdc4dbee8fe73393c5114fae2cdcbfbec3b4de53cd7ed3cae45"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.7/cgx-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "17e7c7987b91aef4858ae9b7f3de86f442e40cec7bab39562d37ae71b988bef7"
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
