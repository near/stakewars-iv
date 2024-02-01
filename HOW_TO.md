## How to join the network?

RPC address will be provided here shortly.

We recommend you to use [near-cli documentation](https://docs.near.org/tools/near-cli).  
The instruction for creating the account will be provided soon as well.

StatelessNet is a sandbox created for testing purposes, concentrating both on correctness and performance.
StatelessNet will be initiated with a copy of mainnet state.
In the future the protocol team may enable mirroring mainnet traffic in StatelessNet.
It means that all the existing mainnet accounts would be already occupied.
It will not affect the activity on mainnet in any case.

The information for receiving some tokens for user's activity will be provided here soon.

## How to become a validator?

The best place to start is [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).

The most recent release of StatelessNet: https://github.com/near/nearcore/tree/statelessnet_latest

You need to build it with the additional argument
```
--features statelessnet_protocol
```

Sample config: [will be provided shortly]

In order to become a validator, you need some tokens.
Please fill in the validator form: [the link to the form will be provided shortly].

### Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 cores

In later stages of StatelessNet we are planning on enabling single shard tracking.
The hardware requirements for single shard tracking will be shared then.

## Support channels
To maximize transparency throughout the process and provide timely support for the community, multiple support channels will be set up, including Github, Near.org, X, Telegram, and Zulip. At the high level, each channel will be used for the following purposes.

### [GitHub for reward program](https://github.com/near/stakewars-iv/tree/main/reward-program)
Users can submit a bug/issue report to the GitHub repository created specifically for StatelessNet. This will be the main channel for reward program participants to share reports.

### [Near.org for detailed status update](https://near.social/mob.near/widget/ProfilePage?accountId=stake-wars.near)
Pagoda/Near Foundation will share detailed StatelessNet status updates and progress reports with community members.

### [X (Ex-Twitter) for high level status update](https://twitter.com/NearStakeWars)
Along with Near.org, Pagoda/Near Foundation will share a brief summary of the StatelessNet status updates and progress reports with community members.

### [Telegram for general Q&A and communication with participants](https://t.me/near_stake_wars)
Pagoda/Near Foundation will maintain telegram channels for each participant type (e.g. validator, smart contract developer, reward program participant) to answer questions and share important updates that may require timely action, such as binary update request for participating nodes in the StatelessNet network.

### [Zulip for technical support](https://near.zulipchat.com/#narrow/stream/422293-pagoda.2Fcore.2Fstake-wars-iv/)
Users can ask technical questions or request technical support from protocol engineering team.
