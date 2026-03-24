# 🖊️ My Rime Config

基于 [雾凇拼音 (rime-ice)](https://github.com/iDvel/rime-ice) 的鼠须管个人配置。

## 特性

- 全拼输入，雾凇拼音词库（长期维护、精准）
- 默认英文标点
- macOS 风格浅色 / 深色主题（自动跟随系统）
- 常用开发工具自动切换英文模式（VS Code、终端、Xcode 等）
- Emoji 联想、日期时间快捷输入、特殊符号输入

## 一键安装

```bash
git clone https://github.com/你的用户名/rime-config.git
cd rime-config
chmod +x setup.sh
./setup.sh
```

脚本会自动完成：安装鼠须管 → 下载雾凇拼音 → 应用自定义配置 → 初始化 Git 仓库。

## 安装后操作

1. **注销并重新登录**（首次安装鼠须管时需要）
2. 系统设置 → 键盘 → 输入法 → 添加「鼠须管」
3. 点击菜单栏输入法图标 → **重新部署**
4. 按 `Control + `` 选择「雾凇拼音」

## 快捷键

| 操作 | 快捷键 |
|------|--------|
| 中英文切换 | `Shift` |
| 方案选单 | `Control + `` |
| 翻页 | `[ / ]` 或 `- / =` |
| 快速日期 | 输入 `rq` |
| 快速时间 | 输入 `sj` |
| 特殊符号 | `v` + 关键字 |
| 部件拆字 | `u` 开头 |

## 自定义配置文件说明

| 文件 | 用途 |
|------|------|
| `rime_ice.custom.yaml` | 输入方案定制（英文标点等） |
| `squirrel.custom.yaml` | 外观主题、App 默认语言 |
| `custom_phrase.txt` | 自定义短语词组 |

> 所有 `.custom.yaml` 文件采用补丁模式，不会被雾凇拼音更新覆盖。

## 更新词库

```bash
cd ~/Library/Rime
# 如果用 plum 管理：
# rime_dir="$HOME/Library/Rime" bash rime-install iDvel/rime-ice:others/recipes/all_dicts
```

## 致谢

- [RIME | 中州韵输入法引擎](https://rime.im/)
- [雾凇拼音 (rime-ice)](https://github.com/iDvel/rime-ice)
