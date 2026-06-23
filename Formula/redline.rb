class Redline < Formula
  desc "Hard time and token/$ budgets for Claude Code sessions"
  homepage "https://github.com/sankalpgunturi/redline"
  url "https://github.com/sankalpgunturi/redline/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "74a48a089dc20ac1c345a016d819bf7e96e29afaafd319525fc800e527759805"
  license "MIT"

  # No node dependency on purpose: redline runs on the Node that ships with
  # Claude Code (its target environment), via the script's `#!/usr/bin/env node`.

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/redline"
  end

  def caveats
    <<~EOS
      redline needs Node (it ships with Claude Code).
      One-time wiring, then restart Claude Code:
        redline install
      Set budgets inside Claude Code:  /redline 10m $5   ·   redline stats
    EOS
  end

  test do
    assert_path_exists bin/"redline"
    assert_match "redline", File.read(libexec/"bin/redline")
  end
end
