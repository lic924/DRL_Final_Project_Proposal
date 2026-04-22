#!/usr/bin/env sh
set -u

required_files="
README.md
docs/01_introduction_A_to_F.md
docs/02_related_work.md
docs/03_proposed_design.md
docs/04_significance_2025_2026.md
docs/05_expected_contribution.md
spec/project-spec.md
spec/environment-spec.md
spec/rl-spec.md
spec/experiment-spec.md
spec/research-gap-spec.md
openspec/project.md
openspec/specs/rl-negotiation-agent/spec.md
"

missing=0

printf '%s\n' "[proposal-check] 檢查必要提案檔案。"

for file in $required_files; do
  if [ -f "$file" ]; then
    printf '%s\n' "[proposal-check] OK: $file"
  else
    printf '%s\n' "[proposal-check] 缺少: $file"
    missing=1
  fi
done

printf '%s\n' "[proposal-check] 檢查必要導論標題。"
for label in "Attention Getter" "Motivation" "But" "Cure" "Development" "Experiments" "Findings" "吸引注意" "動機" "問題轉折" "解法" "發展設計" "實驗" "預期發現"; do
  if grep -q "$label" docs/01_introduction_A_to_F.md; then
    printf '%s\n' "[proposal-check] OK 標題: $label"
  else
    printf '%s\n' "[proposal-check] 缺少標題: $label"
    missing=1
  fi
done

if [ "$missing" -eq 0 ]; then
  printf '%s\n' "[proposal-check] 提案檔案看起來完整。"
else
  printf '%s\n' "[proposal-check] 部分檢查失敗。"
fi

exit "$missing"
