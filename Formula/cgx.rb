class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.1"
  license "MIT"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "REPLACE_WITH_INTEL_SHA256"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v#{version}/cgx-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "REPLACE_WITH_LINUX_SHA256"
  end
  def install
    bin.install "cgx"
    pkgshare.install "web-ui" if File.directory?("web-ui")
  end
  def caveats
    <<~EOS
      cgx has been installed!
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
