#!/bin/bash
# ============================================================
#  鼠须管 (Squirrel) + 雾凇拼音 一键安装脚本
#  使用方法：chmod +x setup.sh && ./setup.sh
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

RIME_DIR="$HOME/Library/Rime"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  🖊️  鼠须管 + 雾凇拼音 一键安装脚本        ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"
echo ""

# ------ 检查依赖 ------
echo -e "${YELLOW}[1/5] 检查环境...${NC}"

if [[ "$(uname)" != "Darwin" ]]; then
    echo -e "${RED}❌ 此脚本仅适用于 macOS${NC}"
    exit 1
fi

if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ 未检测到 Homebrew，请先安装：${NC}"
    echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo -e "${YELLOW}⏳ 正在安装 git...${NC}"
    brew install git
fi

echo -e "${GREEN}✅ 环境检查通过${NC}"

# ------ 安装鼠须管 ------
echo ""
echo -e "${YELLOW}[2/5] 安装鼠须管 (Squirrel)...${NC}"

if [ -d "/Library/Input Methods/Squirrel.app" ]; then
    echo -e "${GREEN}✅ 鼠须管已安装，跳过${NC}"
else
    brew install --cask squirrel
    echo -e "${GREEN}✅ 鼠须管安装完成${NC}"
fi

# ------ 备份原有配置 ------
echo ""
echo -e "${YELLOW}[3/5] 备份并安装雾凇拼音...${NC}"

if [ -d "$RIME_DIR" ] && [ "$(ls -A $RIME_DIR 2>/dev/null)" ]; then
    BACKUP_DIR="$HOME/Library/Rime.bak.$(date +%Y%m%d_%H%M%S)"
    echo -e "  📦 备份原配置到 ${BACKUP_DIR}"
    cp -r "$RIME_DIR" "$BACKUP_DIR"
    rm -rf "$RIME_DIR"/*
else
    mkdir -p "$RIME_DIR"
fi

# ------ 克隆雾凇拼音 ------
echo -e "  ⬇️  正在下载雾凇拼音（可能需要几分钟）..."
git clone https://github.com/iDvel/rime-ice.git "$RIME_DIR" --depth 1 --quiet

# 删掉 .git 目录，保持干净（后面用自己的 repo 管理）
rm -rf "$RIME_DIR/.git"

echo -e "${GREEN}✅ 雾凇拼音安装完成${NC}"

# ------ 应用自定义配置 ------
echo ""
echo -e "${YELLOW}[4/5] 应用自定义配置...${NC}"

# 复制自定义配置文件
if [ -f "$SCRIPT_DIR/squirrel.custom.yaml" ]; then
    cp "$SCRIPT_DIR/squirrel.custom.yaml" "$RIME_DIR/"
    echo -e "  ✅ 皮肤主题配置"
fi

if [ -f "$SCRIPT_DIR/rime_ice.custom.yaml" ]; then
    cp "$SCRIPT_DIR/rime_ice.custom.yaml" "$RIME_DIR/"
    echo -e "  ✅ 英文标点配置"
fi

if [ -f "$SCRIPT_DIR/custom_phrase_extra.txt" ]; then
    # 追加自定义短语到已有文件
    if [ -f "$RIME_DIR/custom_phrase.txt" ]; then
        cat "$SCRIPT_DIR/custom_phrase_extra.txt" >> "$RIME_DIR/custom_phrase.txt"
    else
        cp "$SCRIPT_DIR/custom_phrase_extra.txt" "$RIME_DIR/custom_phrase.txt"
    fi
    echo -e "  ✅ 自定义短语"
fi

echo -e "${GREEN}✅ 自定义配置已应用${NC}"

# ------ 初始化为 Git 仓库 ------
echo ""
echo -e "${YELLOW}[5/5] 初始化 Git 仓库...${NC}"

cd "$RIME_DIR"
git init --quiet
cat > .gitignore << 'EOF'
# 部署生成的文件（不需要同步）
build/
*.userdb/
*.userdb.txt
trash/
sync/

# 系统文件
.DS_Store
*.swp
EOF

git add -A
git commit -m "feat: 初始化鼠须管 + 雾凇拼音配置" --quiet

echo -e "${GREEN}✅ Git 仓库已初始化${NC}"

# ------ 完成 ------
echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  🎉 安装完成！                              ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "接下来请手动完成以下步骤："
echo ""
echo -e "  ${YELLOW}1.${NC} 注销并重新登录 macOS（如果是首次安装鼠须管）"
echo -e "  ${YELLOW}2.${NC} 系统设置 → 键盘 → 输入法 → 编辑 → 添加「鼠须管」"
echo -e "  ${YELLOW}3.${NC} 点击菜单栏输入法图标 → 重新部署 (Deploy)"
echo -e "  ${YELLOW}4.${NC} 按 Control + \` 选择「雾凇拼音」方案"
echo ""
echo -e "  ${YELLOW}📤 推送到 GitHub：${NC}"
echo -e "     cd ~/Library/Rime"
echo -e "     git remote add origin git@github.com:你的用户名/rime-config.git"
echo -e "     git push -u origin main"
echo ""
echo -e "  ${YELLOW}📖 快捷键速查：${NC}"
echo -e "     Shift          → 中英文切换"
echo -e "     Control + \`    → 方案选单"
echo -e "     [ / ]          → 翻页"
echo -e "     输入 rq        → 快速输入日期"
echo -e "     输入 sj        → 快速输入时间"
echo -e "     输入 v + 关键字 → 特殊符号"
echo ""
echo -e "配置目录: ${GREEN}$RIME_DIR${NC}"
echo -e "备份目录: ${GREEN}${BACKUP_DIR:-无}${NC}"
echo ""
