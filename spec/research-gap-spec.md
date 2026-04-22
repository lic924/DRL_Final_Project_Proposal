# Research Gap 規格

## 相關研究領域

相關 prior work 包含：

- reinforcement learning for negotiation。
- LLM-based negotiation agents。
- LLMs as simulators for interactive environments。
- opponent modeling。
- synthetic data generation。
- generalization in reinforcement learning。

## 既有方法限制

許多 negotiation agents 依賴固定 rule-based opponents、小型 datasets 或狹窄 training distributions。這會讓 generalization 評估變得困難。LLM-only negotiation systems 雖然可能產生流暢對話，但仍可能在一致的策略最佳化與 long-horizon bargaining efficiency 上遇到困難。

真實 human negotiation data 可能昂貴、敏感，且難以大量蒐集。這限制了針對 diverse opponent styles 的快速實驗。

## 本專題補足之處

本專題提出一個實用設計，結合：

- 買方的 RL policy learning。
- LLM-generated seller behavior。
- controllable seller personas。
- low-cost synthetic interaction generation。
- explicit seen and unseen opponent evaluation。

主要研究貢獻是測試：由 LLM simulation 生成的 opponent diversity 是否能提升 RL negotiation policy 的 robustness。
