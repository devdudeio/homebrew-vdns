class Vdns < Formula
  desc "VerusID-native DNS-compatible local resolver and web gateway"
  homepage "https://github.com/devdudeio/vdns"
  url "https://github.com/devdudeio/vdns/releases/download/v0.1.4/vdns-0.1.4.tar.gz"
  sha256 "e5f6b5d969dbe71a3e9608de8822dd80dc2cfa6e4ace2dffd45c8c8ab4c940ba"
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
