#!/usr/bin/env sh
set -u

info() {
  printf '%s\n' "[end] $1"
}

warn() {
  printf '%s\n' "[end:warning] $1"
}

missing=0

check_path() {
  if [ -e "$1" ]; then
    info "OK: $1"
  else
    warn "Missing: $1"
    missing=1
  fi
}

info "期末提案儲存庫檢查開始。"

check_path "README.md"
check_path "start.sh"
check_path "end.sh"
check_path "start.shell"
check_path "end.shell"
check_path "package.json"
check_path "AGENTS.md"
check_path "docs/01_introduction_A_to_F.md"
check_path "docs/02_related_work.md"
check_path "docs/03_proposed_design.md"
check_path "docs/04_significance_2025_2026.md"
check_path "docs/05_expected_contribution.md"
check_path "spec/project-spec.md"
check_path "spec/environment-spec.md"
check_path "spec/rl-spec.md"
check_path "spec/experiment-spec.md"
check_path "spec/research-gap-spec.md"
check_path "openspec/project.md"
check_path "openspec/specs/rl-negotiation-agent/spec.md"
check_path "openspec/changes/rl-negotiation-proposal/proposal.md"
check_path "openspec/changes/rl-negotiation-proposal/design.md"
check_path "openspec/changes/rl-negotiation-proposal/tasks.md"
check_path "slides/README.md"
check_path "scripts/proposal-check.sh"

if command -v openspec >/dev/null 2>&1; then
  info "openspec 指令可用。"
else
  warn "PATH 中找不到 openspec 指令。如果老師另外提供 OpenSpec，這可能是可接受的。"
fi

if command -v find >/dev/null 2>&1; then
  info "Markdown 檔案："
  find . -name '*.md' -type f | sort
fi

if [ "$missing" -eq 0 ]; then
  info "儲存庫結構看起來已可用於提案提交。"
else
  warn "部分必要檔案缺失。提交前請檢查上方警告。"
fi

info "Antigravity 仍保留為文件化 placeholder，直到課程提供具體設定方式。"
exit "$missing"
