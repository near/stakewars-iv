# StatelessNet Technical Details

## 1. What are the upcoming changes that StatelessNet includes?

In Q2 2024, NEAR protocol will introduce the biggest upgrade since its mainnet launch in how the protocol operates, Stateless validation. The upgrade includes the following features:
* Stateless validation: Validators do not have to track all shards anymore and can retrieve everything they need to validate the state transition over the network. Stateless validation does not require local tracking of any shards as nodes can retrieve everything they need to validate state change over the network. As a result, NEAR can finally achieve true form of sharding, and hardware requirements for a validator node can be dramatically reduced.
* In memory trie: Validator nodes can load the entire state into RAM for maximized performance. With minimized storage access, transaction throughput will be greatly improved.

The mainnet upgrade will be transparent, and blockchain users should not experience any downtime. No special treatment from validators will be required either. Once stateless validation is in place, it will open the door to a series of additional network performance and scalability improvements.

If you want to know more about stateless validation, please refer to the [following document](https://github.com/near/NEPs/blob/state-validation/neps/nep-0509.md)

## 2. What is Stateless validation StatelessNet?

Considering the critical nature of upcoming changes, Protocol engineering team wants to share them with the community as early as possible so users can (1) understand how they are going to be affected (or not affected) once the changes are applied in Mainnet and (2) provide feedback to Protocol engineering team so the protocol upgrade can be more robust and reliable.

Hence, we are introducing a new network, based on Stateless validation, called StatelessNet. StatelessNet is similar to NEAR Protocol testnet; users can join and participate in various ways, e.g. running a validator node, deploying  a smart contract, and submitting transactions. The main difference is that the nodes participating in StatelessNet are expected to run a binary from the tip of the stateless validation branch, rather than a stable branch. Naturally, StatelessNet aims at fail-fast, fix-fast mode through a tight feedback loop; a new binary may be released multiple times a week, as a result of rapid dynamic interaction between engineering team and participants.
