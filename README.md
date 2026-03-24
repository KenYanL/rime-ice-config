# squirrel_rimeice_yanlin

我的 `Squirrel (鼠须管) + rime-ice (雾凇拼音)` 自定义配置仓库。

适用系统：`macOS`

## 1. 下载与启用

如果你已经安装了鼠须管，并且 `~/Library/Rime` 已存在，直接执行：

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git
cd squirrel_rimeice_yanlin
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

## 2. 首次安装（新 Mac）

如果还没安装鼠须管：

```bash
brew install --cask squirrel
```

然后：
1. 系统设置 -> 键盘 -> 输入法 -> 添加「鼠须管」
2. 切换到鼠须管后，执行上面的“下载与启用”命令
3. 菜单栏输入法中执行“重新部署（Deploy）”也可生效

## 3. 当前基础配置

### 3.1 输入行为（`rime_ice.custom.yaml`）

- 默认中文输入：`switches/@0/reset: 0`
- 默认英文标点：`switches/@1/reset: 1`
- 默认简体：`switches/@2/reset: 0`
- 默认 Emoji 开启：`switches/@3/reset: 1`
- 默认半角：`switches/@4/reset: 0`

### 3.2 模糊音（已开启，保守模式）

- 声母：`zh/ch/sh <-> z/c/s`
- 韵母：`an/ang`、`en/eng`、`in/ing`

### 3.3 界面主题（`squirrel.custom.yaml`）

- 候选框横排、每页 7 个候选
- 浅色和深色主题均已自定义
- 字体与尺寸已按 2K 外接屏做放大

### 3.4 App 默认输入模式

- VSCode / RStudio：默认中文模式（支持混输），标点为英文
- Terminal / iTerm2 / Alacritty：默认英文模式
- Raycast / Spotlight：默认英文模式
- Xcode / JetBrains / Sublime：默认英文模式

## 4. 多台 MacBook 同步

在另一台机器执行：

```bash
git clone https://github.com/KissFighter/squirrel_rimeice_yanlin.git
cd squirrel_rimeice_yanlin
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

后续更新同步：

```bash
cd ~/path/to/squirrel_rimeice_yanlin
git pull
cp squirrel.custom.yaml ~/Library/Rime/
cp rime_ice.custom.yaml ~/Library/Rime/
'/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel' --reload
```

## 5. 文件说明

- `squirrel.custom.yaml`：候选框样式、主题、按 App 的输入模式
- `rime_ice.custom.yaml`：输入行为、开关默认值、模糊音规则

## 6. 注意事项

- 鼠须管颜色值使用 `BGR/AABBGGRR` 编码，不是常见 `RGB`。
- 修改配置后若没生效，先执行 `--reload`，再重启 Squirrel 进程。
