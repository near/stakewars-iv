## How to join the network?

RPC address would be provided here shortly.

We recommend you to use [near-cli documentation](https://docs.near.org/tools/near-cli), e.g. how to [create an account](https://docs.near.org/tools/near-cli#near-create-account).

StatelessNet is a sandbox created for load testing purposes.
The traffic from mainnet may be forwarded to StatelessNet.
It means that all the existing mainnet accounts would be already occupied.
It will not affect the activity on mainnet in any case.

If you need some tokens for your activity, fill out the form: [the link to the form will be provided shortly].

## How to become a validator?

The most recent release of StatelessNet: https://github.com/near/nearcore/commit/ef5564c4950d448144d23488df8b63d45e6b0209

You need to build it with the additional argument
```
--features statelessnet_protocol
```

Sample config: [will be provided shortly]

In order to be able to create staking pool, you need some tokens.
Please fill in the validator form: [the link to the form will be provided shortly].

### Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 cores

We will add the requirements for tracking one shard shortly.

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
