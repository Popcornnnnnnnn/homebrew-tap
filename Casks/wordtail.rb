cask "wordtail" do
  version "1.0.0"
  sha256 "3c9fb4ab2dd8dbef6a10e7d72433962a791620b26af4563cf3b14c2bf7a1ec23"

  url "https://github.com/Popcornnnnnnnn/word-tail/releases/download/v#{version}/WordTail-v#{version}-macOS.zip"
  name "WordTail"
  desc "Zero-LLM single-word inline ghost-text autocomplete for macOS"
  homepage "https://github.com/Popcornnnnnnnn/word-tail"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "WordTail.app"
end
