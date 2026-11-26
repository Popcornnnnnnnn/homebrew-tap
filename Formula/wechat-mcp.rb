class WechatMcp < Formula
  desc "Unified macOS WeChat MCP server, SQLCipher 4 decryptor, and history service"
  homepage "https://github.com/Popcornnnnnnnn/wechat-mcp"
  url "https://github.com/Popcornnnnnnnn/wechat-mcp/releases/download/v0.1.2/wechat_mcp-0.1.2.tar.gz"
  sha256 "49a9edd12813beab8d00f4057c8910e73bd3a230ee40bb28e318d9185f1a4f03"
  license "GPL-3.0-or-later"

  depends_on :macos
  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    ENV["PIP_DISABLE_PIP_VERSION_CHECK"] = "1"
    system venv/"bin/pip", "install", "--no-cache-dir", "--prefer-binary", "."
    bin.install_symlink venv/"bin/wechat-mcp"
  end

  def caveats
    <<~EOS
      Grant Full Disk Access to your terminal or IDE in System Settings > Privacy & Security.
      For WeChat 4.1/4.2 LLDB key extraction, run once:
        sudo DevToolsSecurity -enable
        sudo dscl . append /Groups/_developer GroupMembership "$(whoami)"

      Get started:
        wechat-mcp info
        wechat-mcp upgrade --check
    EOS
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/wechat-mcp --version")
    assert_match "upgrade", shell_output("#{bin}/wechat-mcp --help")
  end
end
