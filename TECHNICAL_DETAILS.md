## What are the upcoming changes?
In Q2 2024, NEAR protocol will introduce the biggest upgrade since its mainnet launch in how the protocol operates, Stateless validation. The upgrade includes the following features:
* Stateless validation: Validators do not have to track all shards anymore and can retrieve everything they need to validate state change (state witness) over the network. With stateless validation, NEAR can finally achieve true form of sharding and hardware requirements for a validator node can be dramatically reduced. State validation does not require local tracking of any shards as nodes can retrieve everything they need to validate state change over the network. As a result, hardware requirements for a validator node can be dramatically reduced.
* In memory trie: Validator nodes can load the entire state into RAM for maximized performance. With minimized storage access, transaction throughput will be greatly improved.

The upgrade will be transparent and blockchain users should not experience any downtime and no special treatment from validators will be required, apart from adjusting the hw specs to the new node roles. Once stateless validation is in place, it will open the door to a series of additional network performance and scalability improvements.

If you want to know more about stateless validation, please refer to the [following document](https://github.com/near/NEPs/blob/state-validation/neps/nep-0509.md)

## What is Stateless validation StatelessNet?
Considering the critical nature of upcoming changes, Protocol engineering team wants to share them with the community as early as possible so users can 1) understand how they are going to be affected (or not affected) once the changes are applied in Mainnet and 2) provide feedback to Protocol engineering team so the protocol upgrade can be more robust and reliable.

Hence, we are introducing a new network, based on Stateless validation, called StatelessNet. StatelessNet is similar to NEAR Protocol testnet; users can join and participate in various ways, e.g. running a validator node, deploying  a smart contract, and submitting transactions. The main difference is that the nodes participating in StatelessNet are expected to run a binary from the tip of the stateless validation branch, rather than a stable branch. Naturally, StatelessNet aims at fail-fast, fix-fast mode through a tight feedback loop; a new binary may be released multiple times a week, as a result of rapid dynamic interaction between engineering team and participants.

### Support channels
To maximize transparency throughout the process and provide timely support for the community, multiple support channels will be set up, including Github, Near.org, X, Telegram, and Zulip. At the high level, each channel will be used for the following purposes.

#### [GitHub for reward program](https://github.com/near/stakewars-iv/tree/main/reward-program)
Users can submit a bug/issue report to the GitHub repository created specifically for StatelessNet. This will be the main channel for reward program participants to share reports.

#### [Near.org for detailed status update](https://near.social/mob.near/widget/ProfilePage?accountId=stake-wars.near)
Pagoda/Near Foundation will share detailed StatelessNet status updates and progress reports with community members.

#### [X (Ex-Twitter) for high level status update](https://twitter.com/NearStakeWars)
Along with Near.org, Pagoda/Near Foundation will share a brief summary of the StatelessNet status updates and progress reports with community members.

#### [Telegram for general Q&A and communication with participants](https://t.me/near_stake_wars)
Pagoda/Near Foundation will maintain telegram channels for each participant type (e.g. validator, smart contract developer, reward program participant) to answer questions and share important updates that may require timely action, such as binary update request for participating nodes in the StatelessNet network.

#### [Zulip for technical support](https://near.zulipchat.com/#narrow/stream/422293-pagoda.2Fcore.2Fstake-wars-iv/)
Users can ask technical questions or request technical support from protocol engineering team.
