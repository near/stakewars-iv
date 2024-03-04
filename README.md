# NEAR Stake Wars IV: Attack of Transactions

NEAR Protocol is preparing a major update of the core protocol architecture that takes scalability to the next level. This update is called stateless validation, and it has ample impact on how the network operates internally. We invite everyone to join an early access network that runs on this new architecture, StatelessNet, and run a stateless validator node or test the network throughput and scalability. StatelessNet is separate from mainnet and testnet.

## 1. Timeline

The entire duration of NEAR Stake Wars IV will be approximately two months, from February untill April 2024. For more information see the detailed timeline [here](TIMELINE.md).

## 2. Participation

Anyone can participate in NEAR Stake Wars IV by joining StatelessNet to confirm successful execution of their use cases, poke arround, run a validator node, or simply to fulfill their curiosity. There is also the opportunity to earn NEAR tokens by participating in the reward programs.

The instruction for joining StatelessNet can be found [here](HOW_TO.md), and the technical details of the network are [here](TECHNICAL_DETAILS.md).

More details about the reward programs can be found [here](REWARDS.md).

## 3. Announcements

February 1st, 2024: StatelessNet was started and is currently running with 5 validator nodes, RPC and Archival nodes. Over the next few days we will gradually expand it and begin sending meaningful traffic to it.

As a quick overview of the network, you can use the following resources:
* [StatelessNet Dashboard](https://nearinc.grafana.net/public-dashboards/451b4c15175b476a9fb00953de40f848)
* List of current RPC nodes: 
  * `https://rpc.statelessnet.near.org`
  * `https://archival-rpc.statelessnet.near.org`
 * [Explorer page](https://legacy.explorer.statelessnet.near.org/)
 * Wallet: [https://statelessnet.mynearwallet.com/](https://statelessnet.mynearwallet.com/)

You can add `/metrics` after the RPC URLs to access a web page with RPC metrics.

## 4. StatelessNet status

#### February 28th, 2024

* Improved orphan witnesses GC.
* Fixed bug with banning the wrong peer if invalid state witness is received.
* Fixed crash in Option::unwrap when spawning async tasks.
* Removed obsolete flat storage creation triggers causing some nodes getting stuck.

#### February 23rd, 2024

* Orphan state witnesses cache is merged. We can resume loadtests on statelessnet soon.
* Security fix: properly validate first chunk after genesis.
* Validator roles and rewards model - understood what the new hardware requirements should be. Analyzing historical data on missing chunks to determine chunk producer stake threshold. Plan to share complete view on the model next week.

#### February 22nd, 2024

We started onboarding community validators.
The list of currently running validators, proposals, and other useful information could be found on [the Epoch Info page](http://34.85.179.209:3030/debug/pages/epoch_info).

#### February 21st, 2024

Continue working on major statelessnet features:
* Orphan state witnesses cache - clarified condition to restrict size, PR will be moved to review stage soon.
* Validator roles and rewards model - understood details of current model and discussed concern with increased network costs.
* In-memory trie - realized the need to improve our TestLoop framework to properly test and enable it. Started working on it.

#### February 16th, 2024

* With new release, every validator can track **only one shard** which they validate. This is a crucial feature allowing to reduce HW requirements and make NEAR more scalable.
* Made progress on new validator rewards model.
* Made progress on enabling in-memory trie which should make transaction processing 2x faster.


#### February 14th, 2024
Bug bounty program is now **LIVE** as of February 14th, 2024. To avoid dupilicate reports, participants are recommended to check out [reported issues in stakewars-iv repository with reward-program-bug-bounty label](https://github.com/near/stakewars-iv/issues) and [reported issues with stateless-validation label](https://github.com/near/nearcore/labels/A-stateless-validation) in nearcore repository.


Updates from the past few days:
* made a new release ([statelessnet-82.0](https://github.com/near/nearcore/releases/tag/statelessnet-82.0)) and updated statelessnet_latest to point to it.
* Found that many missing chunks during loadtest were caused by state witnesses being orphaned. We planned to resolve it later but for now we started working on proper solution as this becomes a higher priority.
* Reduced disk usage required to generate state proofs.
* Found an insidious FlatStorage issue causing node startup time increase when shard has zero load. Made a temporary fix and working on the proper one.
* Made progress with the discussion on what should be the validator roles distribution.
* Made progress in setting up Explorer. The backend is compelted, the front-end requires a few more days of work
* Begun looking at setting up a wallet. This effort is bigger and will likely take more time.

#### February 12th, 2024

* Fixed issue related to 35% missed chunks for all validator. Now there are 0% missed chunks for zero tx load 
* Conducted loadtest. Achieved 300 RPS but some validator missed 80% chunks. Investigating 
* Keeping working on improving test coverage 
* Working on mitigating disk usage increase by 200 GB for state proofs 
* Working on enabling single shard tracking and in-memory trie

#### February 9th, 2024

Added instructions for read-only node and becoming a validator.

#### February 2nd, 2024

We added instructions on how to create an account on StatelessNet and how to use the network.

#### February 1st, 2024

StatelessNet was started, and nodes are running. We noticed an issue impacting block finality and we are currently investignating it and working on a fix. This issue causes blocks to be missed, kickin out validator nodes. During Stage 1 of Stake Wars IV we expect to find issues what were not previously reproduced, and to iterate quickly in fixing them and updating the nodes.
