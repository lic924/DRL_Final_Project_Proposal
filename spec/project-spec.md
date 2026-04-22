# 專案規格

## 目標

設計並評估一個 reinforcement learning 買方議價代理人。此代理人在 used-car price negotiation environment 中，與 LLM-simulated seller opponents 互動訓練。

## 動機

真實 negotiation data 蒐集成本高，且不一定涵蓋多樣化 opponent strategies。RL agents 可能 overfit 到狹窄的 opponent distributions。LLM-simulated opponents 提供低成本方式，可建立 controllable、reusable 且 diverse 的 training interactions。

## 範圍

包含：

- Used-car price negotiation。
- Buyer 作為 RL agent。
- Seller 作為 LLM-simulated opponent。
- Hardline、conceding、random seller personas。
- Q-learning 作為主要 RL method。
- Random 與 rule-based baselines。
- Seen 與 unseen opponent evaluation。

提案階段不包含：

- 完整 production deployment。
- 真實付款或 marketplace integration。
- 宣稱達到 human-level negotiation。
- 已驗證的 Antigravity installation instructions。

## 核心想法

讓 buyer policy 透過 repeated episodes 與多種 LLM-simulated seller personas 訓練，接著測試這種多樣性是否能相較於簡單 baseline 改善 performance 與 generalization。

## 成功標準

- Environment specification 足夠清楚，可供後續實作。
- RL state、action、reward 定義明確。
- Experiment protocol 包含 baselines 與 generalization tests。
- 文件可作為 GitHub submission，並具 OpenSpec-compatible 結構。
- Scripts 可安全檢查 Node.js、OpenSpec 與必要專案檔案。
