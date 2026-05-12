class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.0/cgx-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "d95059f7627beab2db90b44e9df6b2f1ef75110282929cdf19a51ecf5b53c08f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.0/cgx-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "eaffbc7cdcc37b1747bf7edbcca0d298786dc477be9ed6aa9b9b062e921cc53c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.0/cgx-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d21c2b832bece5070776af02ddccc2efe57efa0c0dd8f2faab527d6df2c532d3"
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
