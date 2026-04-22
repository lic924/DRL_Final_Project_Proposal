# Introduction / A. to F.

## 吸引注意（Attention Getter）

隨著人工智慧從被動預測逐漸走向 agentic decision-making，自動化議價變得越來越重要。在電子商務、人力資源、房地產、供應鏈採購與自動化客服等場景中，AI 代理人可能需要針對價格、條件、期限或服務內容進行協商。因此，議價是一個自然且具代表性的測試場域，可用來研究 AI 系統是否能在多回合互動中做出有目標、可調整且能回應對手策略的序列決策。

## 動機（Motivation）

近年 large language models、agentic AI workflow 與 synthetic training environments 快速發展，為 reinforcement learning 研究提供了新的可能性。LLM-based agents 能產生具有互動性的語言行為，而 reinforcement learning 能透過重複試誤學習長期決策策略。當真實互動資料昂貴、稀少、涉及隱私或難以標準化時，這種結合特別具有研究價值。

## 問題轉折（But）

然而，議價對 reinforcement learning 仍然困難。真實人類議價資料通常蒐集成本高，且資料分布可能侷限在特定情境。若買方代理人只與少數固定對手訓練，可能學到脆弱策略：在訓練環境表現良好，但遇到未見過的對手風格時快速失效。另一方面，單純依賴 base LLM 也不一定能得到穩健的 bargaining behavior，因為議價需要長期規劃、策略性讓步與結果效率。

## 解法（Cure）

本專題提出一個 reinforcement learning negotiation framework：RL 買方代理人在訓練時與 LLM-simulated seller opponents 互動。此處不是把 LLM 當成最終決策代理人，而是把 LLM 作為可控制的對手生成器。透過 hardline、conceding、random 等 persona 控制賣方行為，讓買方在訓練過程中接觸更廣的 negotiation strategy distribution。

## 發展設計（Development）

本專題的環境是 used-car price negotiation task。買方是 RL agent，賣方是 LLM-simulated opponent。每個 episode 最多 10 回合。買方觀察 current round、agent previous offer、opponent previous offer、price gap、remaining rounds 與 opponent concession magnitude。買方的 action space 為離散動作：large increase、small increase、keep unchanged、small concession、large concession、accept opponent offer。

## 實驗（Experiments）

實驗設計會將 RL buyer agent 與 random baseline、rule-based baseline 比較。訓練時使用已知 seller personas，評估時同時測量 seen-opponent performance 與 unseen-opponent generalization。評估指標包含 agreement rate、average utility、final price efficiency、number of rounds、breakdown rate、reward trend 與 opponent-type breakdown。

## 預期發現（Findings）

預期結果是：與只面對狹窄對手分布的訓練相比，使用多樣化 LLM-simulated seller opponents 訓練的 RL 買方會有更好的穩健性。本專題預期 RL agent 在 seen opponents 上優於 random 與簡單 rule-based baseline，並在 unseen seller styles 上呈現較佳泛化能力。若實驗支持此結果，將可說明 low-cost synthetic opponent generation 對 negotiation tasks 中的 reinforcement learning 具有實用價值。
