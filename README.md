# rime-ice-config

Personal `Squirrel` + `rime-ice` configuration for macOS.

Platform: `macOS`

## English

### 1. Quick Start

If `Squirrel` is already installed and `~/Library/Rime` already exists, run:

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git rime-ice-config
cd rime-ice-config
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

If the GitHub repository is renamed later, replace the clone URL with the new repository path and keep the local directory name as `rime-ice-config`.

### 2. First-Time Install on a New Mac

If `Squirrel` is not installed yet:

```bash
brew install --cask squirrel-app
```

Then:

1. Open `System Settings -> Keyboard -> Input Sources` and add `Squirrel`.
2. Switch to `Squirrel`, then run the quick start commands above.
3. You can also use `Deploy` from the macOS input method menu to apply the config.

### 3. Current Defaults

#### 3.1 Input Behavior (`rime_ice.custom.yaml`)

- Default to Chinese input: `switches/@0/reset: 0`
- Default to English punctuation: `switches/@1/reset: 1`
- Default to Simplified Chinese: `switches/@2/reset: 0`
- Enable Emoji by default: `switches/@3/reset: 1`
- Default to half-width characters: `switches/@4/reset: 0`

#### 3.2 Fuzzy Pinyin Rules

- Initials: `zh/ch/sh <-> z/c/s`
- Finals: `an/ang`, `en/eng`, `in/ing`

#### 3.3 UI Theme (`squirrel.custom.yaml`)

- Horizontal candidate list with 7 candidates per page
- Custom light and dark themes
- Larger font sizes for a 2K external display
- Subtle translucency enabled for the candidate window

#### 3.4 App-Specific Default Modes

- VSCode / RStudio: default to Chinese input with English punctuation
- Terminal / iTerm2 / Alacritty: default to English mode
- Raycast / Spotlight: default to English mode
- Xcode / JetBrains / Sublime: default to English mode

### 4. Sync Across Multiple Macs

On another Mac:

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git rime-ice-config
cd rime-ice-config
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

To sync later updates:

```bash
cd ~/path/to/rime-ice-config
git pull
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

### 5. Files

- `squirrel.custom.yaml`: candidate window style, themes, and app-specific input defaults
- `rime_ice.custom.yaml`: input behavior, default switches, and fuzzy pinyin rules

### 6. Notes

- `Squirrel` color values use `BGR/AABBGGRR`, not standard `RGB`.
- If a change does not take effect, run `--reload` first, then restart the `Squirrel` process if needed.

## 中文

### 1. 快速开始

如果已经安装了 `Squirrel`，并且 `~/Library/Rime` 已存在，执行：

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git rime-ice-config
cd rime-ice-config
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

如果后面你把 GitHub 仓库真正重命名了，把克隆 URL 改成新的仓库地址即可，本地目录名继续用 `rime-ice-config` 就行。

### 2. 新 Mac 首次安装

如果还没有安装 `Squirrel`：

```bash
brew install --cask squirrel-app
```

然后：

1. 打开 `系统设置 -> 键盘 -> 输入法`，添加 `鼠须管`
2. 切换到 `鼠须管` 后，执行上面的快速开始命令
3. 也可以在 macOS 输入法菜单里执行 `Deploy` 让配置生效

### 3. 当前默认配置

#### 3.1 输入行为（`rime_ice.custom.yaml`）

- 默认中文输入：`switches/@0/reset: 0`
- 默认英文标点：`switches/@1/reset: 1`
- 默认简体：`switches/@2/reset: 0`
- 默认开启 Emoji：`switches/@3/reset: 1`
- 默认半角：`switches/@4/reset: 0`

#### 3.2 模糊音规则

- 声母：`zh/ch/sh <-> z/c/s`
- 韵母：`an/ang`、`en/eng`、`in/ing`

#### 3.3 界面主题（`squirrel.custom.yaml`）

- 候选框横排，每页 7 个候选
- 自定义浅色和深色主题
- 为 2K 外接显示器放大了字体
- 候选框开启了轻微透明效果

#### 3.4 按应用区分的默认模式

- VSCode / RStudio：默认中文输入，标点为英文
- Terminal / iTerm2 / Alacritty：默认英文模式
- Raycast / Spotlight：默认英文模式
- Xcode / JetBrains / Sublime：默认英文模式

### 4. 多台 Mac 同步

在另一台 Mac 上执行：

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git rime-ice-config
cd rime-ice-config
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

后续同步更新：

```bash
cd ~/path/to/rime-ice-config
git pull
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

### 5. 文件说明

- `squirrel.custom.yaml`：候选框样式、主题、按应用区分的输入默认值
- `rime_ice.custom.yaml`：输入行为、默认开关、模糊音规则

### 6. 说明

- `Squirrel` 的颜色值使用 `BGR/AABBGGRR` 编码，不是常见的 `RGB`
- 如果修改后没有立即生效，先执行 `--reload`，必要时再重启 `Squirrel` 进程
