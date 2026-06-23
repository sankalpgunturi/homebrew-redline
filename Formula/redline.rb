class Redline < Formula
  desc "Hard time and token/$ budgets for Claude Code sessions"
  homepage "https://github.com/sankalpgunturi/redline"
  url "https://github.com/sankalpgunturi/redline/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9cae4e2509271b11f26c1dc2424ea1a078a3bad864bd38c97faf5fe0bf4c591b"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/redline"
  end

  def caveats
    <<~EOS
      One-time: wire redline into Claude Code, then restart it:
        redline install
      Set budgets inside Claude Code:
        /redline 10m $5      ·      redline stats
    EOS
  end

  test do
    assert_match "redline 0.1.0", shell_output("#{bin}/redline version")
  end
end
