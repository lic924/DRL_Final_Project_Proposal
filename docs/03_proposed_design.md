# Proposed Design / 規格書

## 目標

建立一個 used-car price negotiation environment，用來評估 RL buyer agent 是否能透過與 LLM-simulated diverse seller opponents 訓練，學到更好的議價策略。

## 系統角色

- Buyer：reinforcement learning agent。
- Seller：LLM-simulated opponent。
- Environment：turn-based used-car price negotiation。
- Evaluator：比較 RL agent、random baseline 與 rule-based baseline 的實驗流程。

## 議價情境

買方與賣方針對二手車價格進行議價。True car value 被視為環境變數。買方希望以高 utility 達成協議，賣方則希望維持有利的 selling price。

每個 episode 最多 10 回合。每回合中，買方可以更新 offer 或接受賣方 offer；賣方則根據 LLM-simulated persona 回應。

## 賣方 Personas

- Hardline：抗拒讓步並維持較高售價。
- Conceding：隨著 deadline 接近逐步降低要求價格。
- Random：引入較不穩定的行為，用來模擬較難預測的議價。

這些 personas 用於建立可控制的 training distribution。額外 unseen personas 或 shifted parameter values 可用於 generalization tests。

## State Representation

買方代理人觀察 compact state：

- current round
- agent previous offer
- opponent previous offer
- price gap
- remaining rounds
- opponent concession magnitude

此 state 可為 Q-learning 離散化。例如 price gap 與 concession magnitude 可轉換成 bins。

## Action Space

買方每回合選擇一個 discrete action：

- large increase: +10 percent
- small increase: +5 percent
- keep unchanged
- small concession: -5 percent
- large concession: -10 percent
- accept opponent offer

實際解釋需依 offer direction 定義。在本提案中，buyer concession 表示買方出價往賣方 asking price 靠近。

## Reward Function

Reward 設計如下：

- agreement reward: `(opponent offer - agent offer) / true car value`
- breakdown penalty: `-1`
- step penalty: `-0.01`

此 reward 鼓勵有效率地達成協議，同時避免不必要的 overpayment。最終實作應確認 reward sign convention，使較高 buyer utility 對應較好的 reward。

## Algorithm Choice

本提案以 Q-learning 作為主要實作方法，原因是環境具有 compact state representation 與 discrete action space。相較於 deep policy-gradient method，Q-learning 更容易解釋、debug 與視覺化，適合課程專題提案。

若後續擴展到 continuous states、language-rich observations 或更大規模的 opponent simulation，PPO 可作為 future extension。

## 評估計畫

RL buyer 將與以下方法比較：

- random baseline
- rule-based concession baseline
- optional ablations with fewer seller personas

評估項目包含：

- agreement rate
- average buyer utility
- final price efficiency
- breakdown rate
- average number of rounds
- seen-opponent performance
- unseen-opponent generalization
