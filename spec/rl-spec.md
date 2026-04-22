# Reinforcement Learning 規格

## State

買方觀察：

- current round
- agent previous offer
- opponent previous offer
- price gap
- remaining rounds
- opponent concession magnitude

對 Q-learning 而言，continuous variables 應離散化為 bins。這可讓 state space 保持可解釋，並適合提案階段的實作規模。

## Action

買方從六個 discrete actions 中選擇：

- large increase: +10 percent
- small increase: +5 percent
- keep unchanged
- small concession: -5 percent
- large concession: -10 percent
- accept opponent offer

在本專題中，buyer concession 表示買方出價往賣方價格靠近。最終實作需一致定義 offer direction。

## Reward

提案中的 reward function：

- agreement reward: `(opponent offer - agent offer) / true car value`
- breakdown penalty: `-1`
- step penalty: `-0.01`

此 reward 鼓勵有利協議，並抑制過長或失敗的談判。

## Algorithm Choice

Q-learning 是主要方法，原因如下：

- the action space is discrete,
- the state can be discretized,
- the method is transparent for a course proposal,
- training curves and Q-values are easier to inspect,
- implementation complexity is lower than deep RL.

## PPO 作為未來擴充

若後續專題納入更大的 state spaces、neural policies、更豐富的 language observations 或 continuous offer values，PPO 可能會有幫助。第一版實作不要求 PPO，因為它會增加超出核心研究問題的複雜度。
