class Vdns < Formula
  desc "VerusID-native DNS-compatible local resolver and web gateway"
  homepage "https://github.com/devdudeio/vdns"
  url "https://github.com/devdudeio/vdns/releases/download/v0.1.3/vdns-0.1.3.tar.gz"
  sha256 "d1dbfc6b48960445c09baf97e44a3b244cf2823ffbf3e950981f83dfe05e297b"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/vdns" => "vdns"
  end

  def caveats
    <<~EOS
      vDNS is installed but no services were started.

      Configure RPC credentials:
        vdns setup

      Install and start the macOS launchd services explicitly:
        vdns install
        vdns start

      Check the stack:
        vdns status
        vdns demo

      Logs and runtime state default to:
        ~/.vdns

      To uninstall services before removing the formula:
        vdns stop
        vdns uninstall
        brew uninstall vdns
    EOS
  end

  test do
    system "#{bin}/vdns", "--version"
    system "#{bin}/vdns", "help"
    system "#{bin}/vdns", "paths"
  end
end
