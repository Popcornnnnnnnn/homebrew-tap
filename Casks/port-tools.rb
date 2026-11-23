cask "port-tools" do
  version "1.0.6"
  sha256 "8d41526d238f9a09af3585e7757798b318c777da7a8f8fb35cb2cf84a755155d"

  url "https://github.com/Popcornnnnnnnn/port-tools/releases/download/v#{version}/Port-Tools-#{version}.dmg"
  name "Port Tools"
  desc "Local-first macOS menu-bar control plane for localhost dev services"
  homepage "https://github.com/Popcornnnnnnnn/port-tools"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Port Tools.app"
end
