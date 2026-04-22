# 實驗規格

## Baselines

RL buyer 將與以下方法比較：

- random buyer baseline。
- rule-based concession baseline。
- optional single-persona trained RL ablation。

## 評估指標

指標：

- agreement rate。
- average buyer utility。
- final price efficiency。
- breakdown rate。
- average number of rounds。
- average reward。
- seen 與 unseen opponents 之間的 generalization gap。

## 訓練流程

1. 定義 used-car value distribution 與 negotiation parameters。
2. 讓 Q-learning buyer 與混合的 LLM-simulated seller personas 訓練。
3. 記錄 episode reward、agreement rate 與 final price。
4. 與 random baseline、rule-based baseline 比較。
5. 在 exploration 關閉或降低的設定下進行 evaluation。

## Seen vs Unseen Opponent Evaluation

Seen-opponent evaluation 使用訓練時已出現的 seller personas，例如 hardline、conceding 與 random。

Unseen-opponent evaluation 使用 shifted settings，例如：

- different concession rate,
- different reservation price range,
- new mixed persona,
- delayed concession behavior,
- more volatile seller responses.

核心問題是：使用 diverse LLM-simulated opponents 訓練，是否能降低 opponent distribution shift 下的 performance drop。

## Optional Analyses

### Reward Trend

繪製 training episodes 中的 reward，以觀察 learning progress。

### Training Stability

測量不同 random seeds 的變異，檢查 performance 是否高度依賴 initialization。

### Opponent-Type Breakdown

分別報告 hardline、conceding、random 與 unseen seller types 的 metrics。

### Concession Curve Analysis

視覺化多回合中的 buyer 與 seller offers，以了解 learned policy 是否有效率議價，或是否等待過久。
