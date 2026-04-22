# 預期貢獻

## 預期貢獻項目

本專題預期貢獻如下：

- 一份乾淨、可實作的 used-car negotiation environment specification，用於 RL training。
- 一個可控制的 LLM-simulated seller 設計，包含 hardline、conceding、random personas。
- 一個適用於 compact discrete negotiation state/action space 的 Q-learning buyer policy。
- 與 random baseline、rule-based baseline 的比較。
- 一套區分 seen-opponent performance 與 unseen-opponent generalization 的 evaluation protocol。
- 對 opponent diversity 是否改善 robustness 的分析。

## 研究價值

本專題處理 negotiation research 中一個實際資料問題：真實人類議價資料昂貴、難以標準化，且多樣性有限。使用 LLM-simulated opponents 可用較低成本產生 repeated training interactions，同時保留對 opponent behavior 的控制。

## 預期結果

預期結果是：與 random baseline 與 rule-based baseline 相比，面對 diverse seller personas 訓練的 RL buyer 會在 average reward、agreement efficiency 與 unseen opponents generalization 上表現更好。本專題也預期 persona diversity 能降低代理人 overfit 到單一 concession pattern 的風險。

這些是預期結果，不是已完成的實驗發現。最終結論應以實作後的 experiment outputs 為準。

## 限制

LLM-simulated seller 不保證完全符合人類議價行為。Persona prompts 可能產生不一致行為，LLM outputs 也可能需要 parsing 或 validation。簡化的 used-car environment 可能省略真實世界的重要因素，例如車況不確定性、貸款、稅費、保固與情緒說服。

Q-learning 也受到 discretization 限制。若 state space 變大，或直接納入語言觀察，PPO 等 deep RL method 可能更適合。

## 未來工作

未來可擴展 richer seller personas、human evaluation、PPO 或 deep Q-learning、natural-language negotiation transcripts、更真實的 car-value distributions，以及 LLM-only negotiators 與 RL-trained negotiators 的比較。
