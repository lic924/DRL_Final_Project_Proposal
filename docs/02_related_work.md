# Related Work / NotebookLM

## 概述

本專題連結 reinforcement learning negotiation、LLM-based negotiation、LLM simulation、opponent diversity、generalization 與 synthetic training environments 等研究方向。本提案不主張已有完成實驗結果，而是以審慎、研究導向的方式，說明此題目如何符合近期 agentic AI 與互動式決策研究趨勢。

## RL Negotiation

Reinforcement learning 適合用於議價，因為 bargaining 本質上是 sequential decision problem。代理人需要根據互動歷史決定是否讓步、維持報價、提高出價或接受對方提案。RL 在議價場景中具有價值，因為它能透過 repeated episodes 直接優化 policy behavior，而不必完全依賴固定的 supervised dataset。

然而，RL negotiation 面臨兩個常見困難。第一，主要 reward 通常在達成協議或談判破裂時才出現，因此 reward 具有延遲性。第二，policy 的表現高度依賴訓練時的 opponent distribution。若代理人只與狹窄或 deterministic opponents 訓練，可能 overfit 到特定模式，導致面對新 negotiation styles 時表現下降。

## LLM Negotiation

近期 LLM-agent 研究逐漸把 negotiation 視為 interactive reasoning、tool use 與 multi-agent behavior 的重要 benchmark。Buyer-seller negotiation 具有挑戰性，因為它需要策略規劃、根據語言訊息推論對手狀態，並在多回合中追求有效率的 settlement。雖然 LLM 能產生流暢的 negotiation dialogue，但語言流暢不等於議價策略最佳。Base LLM 可能接受不利交易、做出不一致讓步，或無法在多回合中維持長期 utility。

因此，本專題採取混合式設計：使用 LLM 進行可控制的 opponent simulation，並使用 reinforcement learning 優化買方 decision policy。

## LLM as Simulator

Synthetic environments 對 scalable agent training 越來越重要。相較於蒐集 human-human negotiation data，LLM 能以較低成本產生可設定的互動行為。在本專題中，LLM 不被視為完美的人類模型，而是作為實用 simulator，在受控 persona 下產生多樣化 seller responses。

LLM simulator 的價值在於能以低設定成本表示多種 opponent patterns。Hardline seller 可以抗拒讓步，conceding seller 可以逐步降低要求，random seller 則能引入不確定性。這種 controlled diversity 有助於系統化評估。

## Opponent Diversity

Opponent diversity 很重要，因為 negotiation agents 必須處理不只一種策略模式。若買方只與 conceding seller 訓練，可能變得過度被動；若只與 hardline seller 訓練，則可能過度支付或無法達成協議。Persona-based opponent generation 能讓 RL agent 接觸更廣泛的行為分布。

本專題會明確區分 seen-opponent evaluation 與 unseen-opponent evaluation，以檢驗對手多樣性是否能提升 generalization。

## Generalization

Generalization 仍是 reinforcement learning 的核心挑戰。RL policy 可能在 training environment 中獲得高 reward，卻在輕微 distribution shift 下失效。在議價中，這種 shift 可能表現為新的 concession schedule、不同 reservation price 或未預期的 seller style。本專題會透過熟悉與不熟悉的 opponent personas 測試買方代理人，直接研究此問題。

## Synthetic Environments

當真實人類資料昂貴、涉及隱私或不一致時，synthetic negotiation environments 具有實用價值。Used-car negotiation 是合理的 proof of concept，因為二手車市場規模大、價格議價行為常見，且任務可簡化為 true car value、seller target price、buyer offer 與 agreement threshold 等明確變數。

本專題刻意將環境設計得足夠簡潔，以符合課程專題規模；同時仍保留 strategy、opponent modeling 與 robust policy learning 等具有研究價值的問題。
