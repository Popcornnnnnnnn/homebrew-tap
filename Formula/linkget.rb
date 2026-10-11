class Linkget < Formula
  desc "Save post photos and videos to macOS Photos or a folder"
  homepage "https://github.com/Popcornnnnnnnn/linkget"
  url "https://github.com/Popcornnnnnnnn/linkget/releases/download/v0.2.1.dev20/linkget-0.2.1.dev20.tar.gz"
  version "0.2.1.dev20"
  sha256 "69b97b46afba1df89461818c1150ced80747560008ff14025c7d9a25a34254e0"
  license "MIT"

  depends_on "deno"
  depends_on "ffmpeg"
  depends_on "exiftool"
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
      Use linkget config to view or change your default save destination.
      Verified Photos imports remove staged copies; failed imports retain originals.
      Uninstalling does not remove your downloads or saved account data.
    EOS
  end

  test do
    assert_match "0.2.1.dev20", shell_output("#{bin}/linkget --version")
    assert_match "Instagram", shell_output("#{bin}/linkget sites")
    assert_match "--folder [FOLDER]", shell_output("#{bin}/linkget help")
    assert_match "Public access", shell_output("LINKGET_HOME=#{testpath}/data #{bin}/linkget auth")
    with_env("LINKGET_HOME" => "#{testpath}/data") do
      assert_match "Photos", shell_output("#{bin}/linkget config")
      assert_match "Saved", shell_output("#{bin}/linkget config --folder")
      assert_match "Current folder", shell_output("#{bin}/linkget config")
    end
  end
end
