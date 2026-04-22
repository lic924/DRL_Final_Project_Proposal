# Design: RL Negotiation Agent

## 架構

規劃中的實作包含四個概念元件：

1. Negotiation environment。
2. 使用 LLM persona prompts 或 controlled response templates 的 seller simulator。
3. 使用 Q-learning 的 buyer policy。
4. 用於 baselines 與 generalization tests 的 evaluation runner。

## 資料流程

1. Environment 初始化 car value 與 offers。
2. Buyer 觀察 compact state。
3. Buyer 選擇 action。
4. Seller simulator 回應。
5. Environment 計算 reward 與 next state。
6. Training loop 更新 Q-values。
7. Evaluation loop 回報 metrics。

## 設計理由

Q-learning 被選為主要方法，是因為它在提案中清楚且可解釋。LLM seller simulation 則可在不蒐集 human negotiation datasets 的情況下，提供 diverse opponent behavior。

## 風險

LLM outputs 可能不一致。實作時應將 seller responses 限制在 valid prices 內，並以 defensive parsing 處理輸出。
