class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.1.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.8/cgx-v0.1.8-aarch64-apple-darwin.tar.gz"
    sha256 "852851b6271e81e5675f324106ec9ee092bb672ea046c14aa4cb088705bbbd8a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.8/cgx-v0.1.8-x86_64-apple-darwin.tar.gz"
    sha256 "1ecf8ec02d33f5bbbd5b9622dbe9ef8abb3124d4893a2810f7d72e53ba7511b2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.1.8/cgx-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3285acf6714a17ab509b12fc92795eada39dfba120d13945f7ec8e65ca91a32e"
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
