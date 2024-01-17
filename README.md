# NEAR Protocol Stateless Validation available for public preview

NEAR Protocol is preparing a major update of the core protocol architecture that takes scalability to the next level. This update is called stateless validation and it has ample impact on how the network operates internally. We invite everyone to join an early access network that runs on this new architecture, StatelessNet, and run a stateless validator node or test the network throughput and scalability.

## What are the upcoming changes?
In Q2 2024, NEAR protocol will introduce the biggest upgrade since its mainnet launch in how the protocol operates, Stateless validation. The upgrade includes the following features:
* Stateless validation: Validators do not have to track all shards anymore and can retrieve everything they need to validate state change (state witness) over the network. With stateless validation, NEAR can finally achieve true form of sharding and hardware requirements for a validator node can be dramatically reduced. State validation does not require local tracking of any shards as they can retrieve everything they need to validate state change over the network. As a result, hardware requirements for a validator node can be dramatically reduced.
* In memory trie: Validator nodes can load the entire state into RAM for maximized performance. With minimized storage access, transaction throughput will be greatly improved. 

The upgrade will be transparent and blockchain users should not experience any downtime and no special treatment from validators will be required, apart from adjusting the hw specs to the new node roles.. Once stateless validation is in place, it will open the door to a series of additional network performance and scalability improvements.

~~If you want to know more about stateless validation, please refer to the following document: HERE~~

## What is Stateless validation StatelessNet?
Considering the critical nature of upcoming changes, Protocol engineering team concluded that it is important to inform the community as early as possible so users can 1) understand how they are going to be affected (or not affected) once the changes are applied in Mainnet and 2) provide feedbacks to Protocol engineering team so the protocol upgrade can be more robust and reliable.

Hence, we are introducing Stateless validation StatelessNet. StatelessNet is similar to NEAR Protocol testnet; users can join and participate in various ways, e.g. running a validator node, deploying  a smart contract, and submitting transactions. The main difference is that the nodes in the network are expected to run a binary from the tip of the stateless validation branch, rather than a stable branch. Naturally, StatelessNet aims at fail-fast, fix-fast mode through a tight feedback loop; a new binary may be released multiple times a week, as a result of rapid dynamic interaction between engineering team and participants.

### Timeline
The entire duration of StatelessNet will be approximately two months, from February 2024 to March 2024. Two stages are planned for StatelessNet, each with different focus areas:
* Stage 1, February, 2024: StatelessNet will focus on demonstrating functional readiness of upcoming changes. MVP version of stateless validation with minimal optimization will be released first and followed by iterations on feature completeness.
* Stage 2, starting in March, 2024: Once all critical features for stateless validation are implemented and corner cases are addressed, StatelessNet will move on to the next stage, focusing on performance and reliability optimization. Multiple rounds of load tests and stress tests will be conducted to test the limit of stateless validation and identify bottlenecks. Engineering focus will be around optimizations on performance and reliability. 

### [Reward program](reward-program/READMD.md)
While community members can join StatelessNet to confirm successful execution of their use cases or simply to fulfill their curiosity, they can also use the opportunity to earn some NEAR token by participating in the reward program. More details can be found HERE.

There are two major ways to participation in the reward program:

#### Bug/issue report (Available for Stage 1 & 2)
A participant can study stateless validation code or play with StatelessNet to identify failure points and submit a bug/issue report. The report should contain enough details about the issue and reproduction steps. The submitted report will be assessed and if valid, the reporter will be rewarded. Amount can vary depending on criticality and completeness of the report. 

#### Traffic generation (Available for Stage 2)
A participant can generate a meaningful amount of traffic on StatelessNet to stress-test the network and claim reward. Goal of the program is to understand the capacity of Stateless validation under unexpected traffic in the network and reward amount will be determined by traffic size and novelty/uniqueness of traffic patterns. For efficient monitoring during traffic generation, each proposal needs to be aligned with the engineering team before execution. 

### Support channels
To maximize transparency throughout the process and provide timely support for the community, multiple support channels will be set up, including Github, Near.org, X, Telegram, and Zulip. At the high level, each channel will be used for the following purposes.

#### GitHub for reward program
Users can submit a bug/issue report to the GitHub repository created specifically for StatelessNet. This will be the main channel for reward program participants to share reports.

#### Near.org for detailed status update
Pagoda/Near Foundation will share detailed StatelessNet status updates and progress reports with community members.

#### X (Ex-Twitter) for high level status update
Along with Near.org, Pagoda/Near Foundation will share a brief summary of the StatelessNet status updates and progress reports with community members.

#### Telegram for general Q&A and communication with participants
Pagoda/Near Foundation will maintain telegram channels for each participant type (e.g. validator, smart contract developer, reward program participant) to answer questions and share important updates that may require timely action, such as binary update request for participating nodes in the StatelessNet network.

#### Zulip for technical support
Users can ask technical questions or request technical support from protocol engineering team.
