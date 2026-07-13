class Redline < Formula
  desc "Give your AI agent a time and money limit"
  homepage "https://github.com/sankalpgunturi/redline"
  url "https://github.com/sankalpgunturi/redline/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7f3aa6baa8ee7a9c1545e2c8dcef6883ef3928be42283017d5336fd24b8b5152"
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
