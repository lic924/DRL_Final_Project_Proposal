#!/usr/bin/env sh
set -u

MIN_NODE_MAJOR=18

info() {
  printf '%s\n' "[start] $1"
}

warn() {
  printf '%s\n' "[start:warning] $1"
}

fail() {
  printf '%s\n' "[start:error] $1"
}

major_version() {
  printf '%s' "$1" | sed 's/^v//' | cut -d. -f1
}

info "Deep RL 提案環境檢查開始。"

if ! command -v node >/dev/null 2>&1; then
  fail "找不到 Node.js。"
  warn "請依照作業系統或老師建議的方式安裝 Node.js ${MIN_NODE_MAJOR}+。"
  warn "腳本會繼續檢查專案檔案，但可能略過 OpenSpec 安裝。"
else
  NODE_VERSION="$(node -v)"
  NODE_MAJOR="$(major_version "$NODE_VERSION")"
  info "偵測到 Node.js $NODE_VERSION。"
  if [ "$NODE_MAJOR" -lt "$MIN_NODE_MAJOR" ]; then
    warn "建議使用 Node.js ${MIN_NODE_MAJOR}+。目前 major version: $NODE_MAJOR。"
  else
    info "Node.js 版本符合建議。"
  fi
fi

if command -v openspec >/dev/null 2>&1; then
  info "OpenSpec 指令已可使用。"
else
  warn "找不到 OpenSpec 指令。"
  if command -v npm >/dev/null 2>&1; then
    info "嘗試透過 npm 全域安裝 @fission-ai/openspec，該套件提供 openspec 指令。"
    if npm install -g @fission-ai/openspec; then
      info "npm 安裝指令已完成。"
    else
      warn "OpenSpec 安裝未完成。請檢查網路、權限或課程指定說明。"
    fi
  else
    warn "找不到 npm，因此略過 OpenSpec 安裝。"
  fi
fi

if command -v openspec >/dev/null 2>&1; then
  info "已確認 openspec 指令可用。"
else
  warn "openspec 指令目前仍不可用。不過已準備好的 openspec/ 目錄仍可供檢查。"
fi

if [ -d "openspec" ]; then
  info "已找到 openspec/ 目錄，不會執行任何破壞性初始化。"
else
  info "建立最小 openspec/ 目錄。"
  mkdir -p openspec/specs openspec/changes
fi

info "Antigravity 提醒：未加入安裝指令，因為設定方式取決於課程環境。"
info "環境檢查完成。"
