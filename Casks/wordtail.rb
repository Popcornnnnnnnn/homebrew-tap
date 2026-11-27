cask "wordtail" do
  version "0.9.2"
  sha256 "ed96ce2fbe2440399fcb4f1ef124f2bb1aa65213397f883e77b98b3d1276148e"

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
