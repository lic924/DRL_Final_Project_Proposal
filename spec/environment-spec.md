# 環境規格

## 情境

此環境模擬 used-car price negotiation。買方與賣方針對車輛價格進行協商。買方偏好較低成交價格，賣方偏好較高成交價格。Episode 會以 agreement、breakdown 或 timeout 結束。

## Agents

- Buyer：正在訓練的 RL policy。
- Seller：由 persona prompts 與 environment variables 控制的 LLM-simulated opponent。

## Personas

### Hardline

維持較高 asking price，只做小幅讓步，並可能拒絕過低 offer。

### Conceding

一開始提出較高 asking price，但隨著 deadline 接近逐步降低要求。

### Random

使用較 noisy 的 concession behavior 產生不確定性，用於 stress-test buyer policy。

## Episode 長度

最大回合數：10。

每回合包含：

1. Buyer 觀察 state。
2. Buyer 選擇 action。
3. Seller 根據 persona 回應。
4. Environment 更新 state 與 reward。

## 終止條件

Episode 在以下情況終止：

- the buyer accepts the seller's offer,
- the seller accepts the buyer's offer,
- the round limit is reached,
- the negotiation breaks down because offers remain incompatible by the deadline.

## 環境變數

建議變數：

- true car value
- seller initial asking price
- buyer initial offer
- seller reservation price
- buyer budget
- persona type
- current round
