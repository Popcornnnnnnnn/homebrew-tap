cask "wordtail" do
  version "0.9.1"
  sha256 "85a25daacce9b00063d57e335ca067621164ab3df71150aacc4ab3042d62e8a0"

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
