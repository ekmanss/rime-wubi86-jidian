#!/usr/bin/env bash
set -euo pipefail

# 一键部署 Rime 极点五笔 86 配置到 macOS Squirrel（鼠须管）
# 用法：
#   ./deploy.sh          同步配置并触发 Squirrel 重新部署
#   ./deploy.sh --clean  额外清理 ~/Library/Rime/build 后重新部署

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RIME_DIR="${HOME}/Library/Rime"
SQUIRREL_BIN="/Library/Input Methods/Squirrel.app/Contents/MacOS/Squirrel"

CLEAN_BUILD=false
for arg in "$@"; do
  case "$arg" in
    --clean)
      CLEAN_BUILD=true
      ;;
    -h|--help)
      echo "用法: $0 [--clean]"
      echo "  --clean  部署前清空 ${RIME_DIR}/build 中的旧编译产物"
      exit 0
      ;;
    *)
      echo "未知参数: $arg" >&2
      exit 1
      ;;
  esac
done

mkdir -p "$RIME_DIR"

echo "==> 同步配置到 ${RIME_DIR}"
rsync -av \
  --exclude='.git/' \
  --exclude='.github/' \
  --exclude='.gitignore' \
  --exclude='.DS_Store' \
  --exclude='README.md' \
  --exclude='GUIDE.md' \
  --exclude='LICENSE' \
  --exclude='imgs/' \
  --exclude='deploy.sh' \
  "${REPO_DIR}/" "${RIME_DIR}/"

if [ "$CLEAN_BUILD" = true ] && [ -d "${RIME_DIR}/build" ]; then
  echo "==> 清理旧的 build 目录: ${RIME_DIR}/build"
  rm -rf "${RIME_DIR}/build"
fi

if [ -x "$SQUIRREL_BIN" ]; then
  echo "==> 触发 Squirrel 重新部署..."
  "$SQUIRREL_BIN" --reload
  echo "==> 部署完成！"
else
  echo "警告：未找到 Squirrel 可执行文件 (${SQUIRREL_BIN})，请手动在菜单栏点击「重新部署」。" >&2
fi
