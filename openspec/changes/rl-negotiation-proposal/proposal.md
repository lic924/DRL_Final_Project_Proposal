# Change Proposal: RL Negotiation Agent

## 摘要

建立一份提案與實作規格，主題是在 used-car negotiation environment 中，訓練一個面對 LLM-simulated seller opponents 的 reinforcement learning buyer agent。

## 動機

真實 negotiation data 成本高，且狹窄 opponent distributions 可能造成 RL overfitting。LLM-simulated opponents 提供低成本方式，可產生 controllable 且 diverse 的 training interactions。

## Proposed Change

新增專案規格，涵蓋：

- environment design。
- RL state、action、reward。
- LLM seller personas。
- training and evaluation protocol。
- seen and unseen opponent generalization。

## Non-Goals

- 不包含 production marketplace deployment。
- 不宣稱 LLM sellers 能完美模擬人類。
- 不加入未經確認的 Antigravity installation commands。
