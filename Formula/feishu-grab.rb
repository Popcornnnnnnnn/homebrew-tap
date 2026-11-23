class FeishuGrab < Formula
  desc "Export Feishu and Lark documents using your daily Chrome session"
  homepage "https://github.com/Popcornnnnnnnn/feishu-doc-grabber"
  url "https://github.com/Popcornnnnnnnn/feishu-doc-grabber/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "664abb285aa145fcb3866f604f8f0b9c04b2b76f888cbbae358380373d7ac407"
  license "ISC"

  depends_on :macos
  depends_on "node"

  def install
    libexec.install "cli.mjs", "grab.mjs", "lib", "mcp", "package.json", "package-lock.json"
    (libexec/"tools").install "tools/ai-chrome.mjs"
    ENV.prepend_path "PATH", formula_opt_libexec("node")/"bin"
    cd libexec do
      system "npm", "ci", "--omit=dev", "--ignore-scripts", "--no-audit", "--no-fund"
    end

    {
      "feishu-grab"     => "cli.mjs",
      "feishu-grab-mcp" => "mcp/server.mjs",
      "feishu-chrome"   => "tools/ai-chrome.mjs",
    }.each do |name, script|
      (bin/name).write <<~SH
        #!/bin/sh
        exec "#{formula_opt_bin("node")}/node" "#{libexec/script}" "$@"
      SH
      (bin/name).chmod 0755
    end
    man1.install "docs/feishu-grab.1"
    doc.install "README.md", "INTEGRITY.md", "CHANGELOG.md", "LICENSE"

    {
      bash_completion/"feishu-grab"      => "bash",
      zsh_completion/"_feishu-grab"      => "zsh",
      fish_completion/"feishu-grab.fish" => "fish",
    }.each do |path, shell|
      path.dirname.mkpath
      path.write Utils.safe_popen_read((bin/"feishu-grab").to_s, "completion", shell)
    end
  end

  def caveats
    <<~EOS
      Run feishu-grab and paste a Feishu/Lark link (or press Enter for the active Chrome tab).
      Use --folder to save to the current folder, or feishu-grab config to set a default.

      Daily Chrome requires:
        View > Developer > Allow JavaScript from Apple Events
      If prompted by macOS, allow your terminal to control Google Chrome.

      Get started:
        feishu-grab --help
        feishu-grab doctor
        feishu-grab current --folder

      Authentication stays in Chrome. No browser extension is required.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/feishu-grab --version").strip
    assert_match "Commands:", shell_output("#{bin}/feishu-grab --help")
    assert_match "upgrade", shell_output("#{bin}/feishu-grab help upgrade")
    assert_match "Export options:", shell_output("#{bin}/feishu-grab help export")
    assert_match "feishu-grab batch", shell_output("#{bin}/feishu-grab batch --help")
    assert_match "feishu-grab retry", shell_output("#{bin}/feishu-grab retry --help")
    assert_match "Unknown option", shell_output("#{bin}/feishu-grab --invalid-option 2>&1", 64)
    with_env("FEISHU_GRAB_STATE" => "#{testpath}/state.json") do
      assert_match "\"defaultOut\": null", shell_output("#{bin}/feishu-grab config --json")
      assert_match "Saved default output: Current folder", shell_output("#{bin}/feishu-grab config --folder")
    end
    (testpath/"report.json").write('{"schemaVersion":1,"documents":[]}')
    assert_match "0 document(s)", shell_output("#{bin}/feishu-grab report #{testpath}/report.json")
    assert_match "schemaVersion", shell_output("#{bin}/feishu-grab report #{testpath}/report.json --json")
    assert_match "#compdef feishu-grab", shell_output("#{bin}/feishu-grab completion zsh")
    mcp_init = '{"jsonrpc":"2.0","id":1,"method":"initialize"}'
    mcp_out = pipe_output("#{bin}/feishu-grab-mcp", "#{mcp_init}\n")
    assert_match '"name":"feishu-grab"', mcp_out
  end
end
