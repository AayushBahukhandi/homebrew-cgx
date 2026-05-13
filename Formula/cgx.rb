class Cgx < Formula
  desc "Turn any Git repository into a queryable knowledge graph"
  homepage "https://github.com/AayushBahukhandi/cgx"
  version "0.4.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.1/cgx-v0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "4186662c2689405125a46e65d375e2e43781bf9e5396a1eb505104b4dba2ca9e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.1/cgx-v0.4.1-x86_64-apple-darwin.tar.gz"
    sha256 "62e9de1fe5705f47272050b9c302924ea0eec6287082789e88344097be3e2c26"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/AayushBahukhandi/cgx/releases/download/v0.4.1/cgx-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "035e1eab1853def75604ed15ba254a58baaeab81016c24c7a4857f180be529d5"
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
