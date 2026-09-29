class Linkget < Formula
  desc "Save post photos and videos to macOS Photos or a folder"
  homepage "https://github.com/Popcornnnnnnnn/linkget"
  url "https://github.com/Popcornnnnnnnn/linkget/releases/download/v0.2.0b2/linkget-0.2.0b2.tar.gz"
  version "0.2.0b2"
  sha256 "9d3e41ca173153abca891478acaef8ca9f11b0ab8fe8f9239baa0f850b65f0e8"
  license "MIT"

  depends_on "deno"
  depends_on "ffmpeg"
  depends_on "gallery-dl"
  depends_on :macos
  depends_on "python@3.14"
  depends_on "yt-dlp"

  def install
    libexec.install "src/linkget"
    (bin/"linkget").write <<~SH
      #!/bin/sh
      exec "#{formula_opt_bin("python@3.14")}/python3.14" "#{libexec}/linkget/cli.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Run linkget and paste a post link. Use --folder to save to the current folder.
      Photos imports retain originals in ~/Library/Application Support/linkget/originals.
      Uninstalling does not remove your downloads or saved account data.
    EOS
  end

  test do
    assert_match "0.2.0b2", shell_output("#{bin}/linkget --version")
    assert_match "Instagram", shell_output("#{bin}/linkget sites")
    assert_match "--folder [FOLDER]", shell_output("#{bin}/linkget help")
    assert_match "Not connected", shell_output("LINKGET_HOME=#{testpath}/data #{bin}/linkget auth")
  end
end
