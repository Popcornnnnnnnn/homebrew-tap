# Homebrew tap

Personal installation source for macOS apps and CLI/MCP tools:

- **Apps (Casks):** [Port Tools](https://github.com/Popcornnnnnnnn/port-tools) (`port-tools`), [WordTail](https://github.com/Popcornnnnnnnn/word-tail) (`wordtail`)
- **CLI / MCP tools (Formulae):** [linkget](https://github.com/Popcornnnnnnnn/linkget), [feishu-grab](https://github.com/Popcornnnnnnnn/feishu-doc-grabber), [wechat-mcp](https://github.com/Popcornnnnnnnn/wechat-mcp)

## Install

### Apps

```sh
brew install --cask Popcornnnnnnnn/tap/port-tools
brew install --cask Popcornnnnnnnn/tap/wordtail
```

Both apps include built-in in-app automatic update checks (Sparkle for Port Tools; signed GitHub Release updater for WordTail).

### linkget

```sh
brew install Popcornnnnnnnn/tap/linkget
linkget
```

macOS only. Homebrew installs Python, gallery-dl, yt-dlp, ffmpeg and Deno.

### feishu-grab

```sh
brew install Popcornnnnnnnn/tap/feishu-grab
feishu-grab
```

macOS only. Homebrew installs Node.js, the manual page, shell completions, `feishu-grab`, `feishu-grab-mcp`, and `feishu-chrome`.

### wechat-mcp

```sh
brew install Popcornnnnnnnn/tap/wechat-mcp
wechat-mcp info
```

macOS only. Homebrew installs Python 3.12 and `wechat-mcp`.

## Update

All three CLI tools support built-in daily update checks and one-command upgrades:

```sh
linkget upgrade
feishu-grab upgrade
wechat-mcp upgrade
```

Or via Homebrew:

```sh
brew update
brew upgrade --cask port-tools wordtail
brew upgrade linkget gallery-dl yt-dlp ffmpeg deno feishu-grab wechat-mcp
```

## Remove

```sh
brew uninstall --cask port-tools wordtail
brew uninstall linkget feishu-grab wechat-mcp
```

For `linkget`: downloads, Photos items and local account data are retained. Photos originals may be referenced by your library; do not delete them just to uninstall. See [data retention and removal](https://github.com/Popcornnnnnnnn/linkget/blob/main/docs/INSTALL.md).


<!-- workspace-maintenance:start -->
## 维护与问题入口

代码与必要文档沿用 [GitHub 仓库](https://github.com/Popcornnnnnnnn/homebrew-tap)；需跟进的问题统一从 [Issues](https://github.com/Popcornnnnnnnn/homebrew-tap/issues) 接续，先查重，再记录进展与完成条件。
项目功能与验收沿用已有记录。
<!-- workspace-maintenance:end -->
