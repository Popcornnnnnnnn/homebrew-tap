# Homebrew tap

[English](README.md) · **简体中文**

面向 macOS 应用与 CLI/MCP 工具的个人 Homebrew 安装源：

- **应用（Casks）：** [Port Tools](https://github.com/Popcornnnnnnnn/port-tools)（`port-tools`）、[WordTail](https://github.com/Popcornnnnnnnn/word-tail)（`wordtail`）
- **CLI / MCP 工具（Formulae）：** [linkget](https://github.com/Popcornnnnnnnn/linkget)、[feishu-grab](https://github.com/Popcornnnnnnnn/feishu-doc-grabber)、[wechat-mcp](https://github.com/Popcornnnnnnnn/wechat-mcp)

## 安装

在 Homebrew 7.0+ 中，首次安装新的 Formula 或 Cask 前需先信任此第三方 Tap（或在提示时信任单个软件）：

```sh
brew trust Popcornnnnnnnn/tap
```

### 应用

```sh
brew install --cask Popcornnnnnnnn/tap/port-tools
brew install --cask Popcornnnnnnnn/tap/wordtail
```

两款应用均内置应用内自动更新检查（Port Tools 使用 Sparkle；WordTail 使用已签名的 GitHub Release 更新器）。

### linkget

```sh
brew install Popcornnnnnnnn/tap/linkget
linkget
```

仅支持 macOS。Homebrew 会一并安装 Python、`gallery-dl`、`yt-dlp`、`ffmpeg` 与 Deno。

### feishu-grab

```sh
brew install Popcornnnnnnnn/tap/feishu-grab
feishu-grab
```

仅支持 macOS。Homebrew 会安装 Node.js、手册页、Shell 自动补全、`feishu-grab`、`feishu-grab-mcp` 与 `feishu-chrome`。

### wechat-mcp

```sh
brew install Popcornnnnnnnn/tap/wechat-mcp
wechat-mcp info
```

仅支持 macOS。Homebrew 会安装 Python 3.12 与 `wechat-mcp`。

## 更新

三款 CLI 工具均内置每日更新检查与一键升级命令：

```sh
linkget upgrade
feishu-grab upgrade
wechat-mcp upgrade
```

或通过 Homebrew 更新：

```sh
brew update
brew upgrade --cask port-tools wordtail
brew upgrade linkget gallery-dl yt-dlp ffmpeg deno feishu-grab wechat-mcp
```

## 卸载

```sh
brew uninstall --cask port-tools wordtail
brew uninstall linkget feishu-grab wechat-mcp
```

关于 `linkget`：已下载文件、照片图库中的项目与本地账号数据都会保留。照片原件可能仍被图库引用，请勿仅为了卸载而直接删除它们。详见 [数据保留与卸载说明](https://github.com/Popcornnnnnnnn/linkget/blob/main/docs/INSTALL.md)。


<!-- workspace-maintenance:start -->
## 维护与问题入口

代码与必要文档沿用 [GitHub 仓库](https://github.com/Popcornnnnnnnn/homebrew-tap)；需跟进的问题统一从 [Issues](https://github.com/Popcornnnnnnnn/homebrew-tap/issues) 接续，先查重，再记录进展与完成条件。
项目功能与验收沿用已有记录。
<!-- workspace-maintenance:end -->
