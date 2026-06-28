class Redline < Formula
  desc "Give your AI agent a time and money limit"
  homepage "https://github.com/sankalpgunturi/redline"
  url "https://github.com/sankalpgunturi/redline/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1fc8a988ab0683b730ae219b18e71622cad27cb0bec949130b87c395335f161d"
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
