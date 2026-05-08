class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.6/cgx-v0.1.6-aarch64-apple-darwin.tar.gz"
    sha256 "6c8b54080839438948f11b264c518d296180ce09d74e9e34a7f9cb88ed56e723"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.6/cgx-v0.1.6-x86_64-apple-darwin.tar.gz"
    sha256 "fc69f15b451240edc11668e1e8727597a293337feedc8fc29631989304b3cc80"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.6/cgx-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0444a0dd379fdb0180a058dd823a31cd458709c274f4f20ba714787e4c799c02"
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
