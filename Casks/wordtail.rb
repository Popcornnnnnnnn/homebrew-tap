cask "wordtail" do
  version "0.8.3"
  sha256 "e3511b9beb4b1c7dc7b9ed2ae4022b8e79c06c3876e213bbf38133e15d59ad4f"

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
