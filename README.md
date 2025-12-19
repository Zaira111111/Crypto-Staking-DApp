# 🥩 Crypto Staking DApp

A decentralized application that allows users to stake their ERC20 tokens and earn rewards over time.

## 🚀 Features
- **Stake Tokens:** Users can lock their tokens in the contract.
- **Earn Rewards:** Get reward tokens based on the staking duration.
- **Unstake:** Withdraw tokens along with the accumulated rewards.
- **Real-time Updates:** Track your earnings in real-time.

## 🛠️ Tech Stack
- **Smart Contracts:** Solidity
- **Framework:** Hardhat / Foundry
- **Frontend:** React.js, Ethers.js
- **Tokens:** ERC-20 Standard

## 📜 Logic & Math
The rewards are calculated based on:
`Reward = (Staked Amount * Reward Rate * Time) / Scaling Factor`

## ⚙️ How to Run
1. Install dependencies: `npm install`
2. Compile contracts: `npx hardhat compile`
3. Deploy: `npx hardhat run scripts/deploy.js --network localhost`
