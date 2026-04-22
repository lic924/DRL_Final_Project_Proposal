# 使用 LLM 模擬多樣化對手的強化學習議價代理人

課程：Deep Reinforcement Learning  
作業類型：Final Project Proposal  
主題：在二手車價格議價環境中，訓練一個以強化學習為核心的買方代理人，並使用 LLM 模擬不同類型的賣方對手。

## 專案摘要

本儲存庫是一份可提交至 GitHub 的深度強化學習期末專題提案。專案提出一個二手車價格議價環境：買方是 reinforcement learning agent，賣方則由 large language model 模擬，並透過 persona 控制不同的對手風格。

核心研究問題是：如果 RL 買方代理人在訓練時面對多樣化的 LLM 模擬賣方，是否能提升它對已見過與未見過對手風格的泛化能力。預計的賣方 persona 包含 hardline、conceding、random；比較基準包含 random buyer 與 rule-based buyer。

## 指定提案章節

本提案依照課堂要求整理為三個主要部分：

- Introduction / A. to F.：[docs/01_introduction_A_to_F.md](docs/01_introduction_A_to_F.md)
- Related Work / NotebookLM：[docs/02_related_work.md](docs/02_related_work.md)
- Proposed Design / 規格書：[docs/03_proposed_design.md](docs/03_proposed_design.md)

補充文件：

- 2025-2026 重要性與趨勢：[docs/04_significance_2025_2026.md](docs/04_significance_2025_2026.md)
- 預期貢獻：[docs/05_expected_contribution.md](docs/05_expected_contribution.md)

## 專案結構

```text
.
├── .gitignore
├── AGENTS.md
├── README.md
├── end.sh
├── end.shell
├── package.json
├── start.sh
├── start.shell
├── docs/
│   ├── 01_introduction_A_to_F.md
│   ├── 02_related_work.md
│   ├── 03_proposed_design.md
│   ├── 04_significance_2025_2026.md
│   └── 05_expected_contribution.md
├── openspec/
│   ├── project.md
│   ├── changes/
│   │   └── rl-negotiation-proposal/
│   │       ├── design.md
│   │       ├── proposal.md
│   │       └── tasks.md
│   └── specs/
│       └── rl-negotiation-agent/
│           └── spec.md
├── scripts/
│   └── proposal-check.sh
├── slides/
│   ├── Zero-Shot_Negotiation_via_LLM_Environments.pdf
│   └── README.md
└── spec/
    ├── environment-spec.md
    ├── experiment-spec.md
    ├── project-spec.md
    ├── research-gap-spec.md
    └── rl-spec.md
```

## 環境設定

本儲存庫不是 JavaScript 應用程式。加入 Node.js 檢查，是因為老師明確提到 GitHub submission、Node、OpenSpec、Antigravity 與 shell scripts。

建議 Node.js 版本：18 或以上。

執行設定檢查：

```sh
sh start.sh
```

執行最終檢查：

```sh
sh end.sh
```

老師明確提到 `start.shell` 與 `end.shell`，因此本專案也包含包裝腳本：

```sh
sh start.shell
sh end.shell
```

## OpenSpec 說明

本儲存庫包含 `openspec/` 目錄，內含 project overview、change proposal、task list 與 implementation-oriented feature spec。`start.sh` 會檢查 `openspec` 指令是否可用；如果系統有 npm，腳本會嘗試透過 `@fission-ai/openspec` 安裝，該套件目前提供 `openspec` binary。

如果課程使用老師指定的 OpenSpec 版本，請優先使用老師提供的版本。本專案腳本採安全設計，不會覆蓋既有 OpenSpec 專案。

## Antigravity 說明

老師提到 Antigravity，但目前沒有可確認的安裝方式。因此本儲存庫不會編造安裝指令。Antigravity 的設定應依照老師或課程環境提供的方式執行；腳本只會印出提醒，不會執行未確認的命令。

## 文件說明

- `docs/01_introduction_A_to_F.md`：包含 Attention Getter、Motivation、But、Cure、Development、Experiments、Findings 的提案導論。
- `docs/02_related_work.md`：說明 RL negotiation、LLM negotiation、LLM simulator、opponent diversity 與 generalization 的研究定位。
- `docs/03_proposed_design.md`：以規格書形式描述系統設計。
- `docs/04_significance_2025_2026.md`：說明此題目為何符合 2025-2026 的研究與產業趨勢。
- `docs/05_expected_contribution.md`：整理預期貢獻、限制與未來工作。
- `spec/*.md`：實作導向規格，包含環境、RL formulation、實驗流程與 research gap。
- `openspec/`：供課程檢查使用的 OpenSpec-compatible 結構。
- `slides/`：期末提案簡報材料，包含 [Zero-Shot_Negotiation_via_LLM_Environments.pdf](slides/Zero-Shot_Negotiation_via_LLM_Environments.pdf)。

## 目前狀態

這是一個提案與規格儲存庫，尚不是完整實作。它定義了可行的專題方向、實驗設計與後續實作所需的規格結構。
