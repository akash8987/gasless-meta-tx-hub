# Gasless Meta-Transaction Hub

This repository provides a streamlined, professional implementation of **EIP-712 Meta-Transactions**. It enables a "Gasless" user experience where users sign a typed data structure off-chain, and a relayer pays the gas fees to execute the transaction on-chain.

## Key Features
* **EIP-712 Compliant:** Secure, typed data signing for better user visibility in wallets like MetaMask.
* **Replay Protection:** Built-in nonce management to prevent signature reuse.
* **Minimalist Design:** Flat architecture for easy integration into existing dApps.

## How it Works
1.  **User** signs a message (the intent) using their private key.
2.  **Relayer** receives the signature and the message.
3.  **Smart Contract** verifies the signature and executes the logic on behalf of the user.

## Getting Started
1. Install dependencies: `npm install`
2. Compile contracts: `npx hardhat compile`
3. Deploy: `npx hardhat run deploy.js`
