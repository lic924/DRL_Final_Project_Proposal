# RL Negotiation Agent 規格

## Requirement: Used-Car Negotiation Environment

系統應定義一個 turn-based used-car negotiation environment，包含 buyer、seller、price offers、maximum rounds 與 terminal outcomes。

### Scenario: Episode Starts

Given true car value、initial seller ask 與 initial buyer offer  
When negotiation episode 開始  
Then environment 提供 initial state 給 buyer agent。

### Scenario: Episode Terminates

Given active negotiation episode  
When agreement 被接受、round limit 到達，或 breakdown 發生  
Then environment 回傳 terminal reward 與 final status。

## Requirement: RL Buyer Agent

系統應將 buyer 表示為 reinforcement learning agent，並使用 discrete actions，以及基於 agreement utility、breakdown penalty、step penalty 的 reward function。

### Scenario: Buyer Chooses Action

Given current state  
When buyer policy 被查詢  
Then 它選擇一個已定義 negotiation action。

## Requirement: LLM-Simulated Seller Opponents

系統應支援 hardline、conceding 與 random behavior 的 seller personas。

### Scenario: Persona Controls Seller Style

Given seller persona  
When seller 回應 buyer offer  
Then response 應符合預期 concession pattern，並維持在 environment constraints 內。

## Requirement: Evaluation

系統應評估 random、rule-based 與 RL buyers 面對 seen 與 unseen seller opponents 的表現。

### Scenario: Generalization Test

Given trained RL buyer  
When buyer 面對 unseen seller style 評估  
Then 系統記錄 utility、agreement rate、breakdown rate 與 number of rounds。
