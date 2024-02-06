# How to join StatelessNet?

## 1. RPC and archival nodes

Available RPC and archival nodes:
* `https://rpc.statelessnet.near.org`
* `https://archival-rpc.statelessnet.near.org`

## 2. near-cli support

We recommend using [near-cli-rs](https://docs.near.org/tools/near-cli-rs). Install it with the following command:
```bash
cargo install near-cli-rs
```
All the examples below are using [near-cli-rs](https://docs.near.org/tools/near-cli-rs), don't confuse it with [near-cli](https://docs.near.org/tools/near-cli). 

The easiest way to figure out which near cli version is the default on your machine is running
```bash
near --version
# Should show you something like
# near-cli-rs 0.7.7
```

First, you need to add the new network:
```bash
near config add-connection --network-name statelessnet --connection-name statelessnet --rpc-url https://rpc.statelessnet.near.org/ --wallet-url https://rpc.statelessnet.near.org/ --explorer-transaction-url https://rpc.statelessnet.near.org/
```
*Only RPC URL is provided correctly in this command, but it's fine because it's the only URL we will use further.*

## 3. Create an account on StatelessNet

There is no wallet developped for StatelessNet. Account creation is handled via a web serivce (available [here](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/)) and interaction with the account is later done via near-cli.

In order to use the [web service for creating the account](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/), you need to provide two things: (1) an account name and (2) a public key.
1. Account name: the account name has to be in the format <your-account-name>.statelessnet, and has to respect the NEAR [account ID rules](https://nomicon.io/DataStructures/Account#account-id-rules). Note that StatelessNet does NOT support [implicit accounts](https://nomicon.io/DataStructures/Account#implicit-account-ids).
2. Public key (part of a private/public key pair):
   Using near-cli-rs, this command will generate the keys:
```bash
near account create-account fund-later use-auto-generation save-to-folder ./<your-account-name>.statelessnet
```
  The name here (`<your-account-name>.statelessnet`) is just for file naming and doesn't need to match any specific account.
  
  Locate the public key: find the file `<your-account-name>.statelessnet` in the specified folder. Open the file. The public key is found under `public_key` and looks like `ed25519:....` Copy all the string of the key, including the "`ed25519:`" part.

Enter the account name and the a public key in the web service page, press "Create Account" and your account will be automatically created. You'll also receive 10 StatelessNet tokens for all your experiments.

Notes
* StatelessNet is a sandbox created for testing purposes, concentrating both on correctness and performance.
* StatelessNet will be initiated with a copy of mainnet state.
* In the future the protocol team may enable mirroring mainnet traffic in StatelessNet.
* It means that all the existing mainnet accounts would be already occupied.
* StatelessNet will not affect the activity on mainnet in any case.

## 4. How to become a validator?

*This section is work in progress. We will update it soon with a more crisp description for how to run a node.*

### 4.1 Basic instructions

* Compiling and running a near node is detailes in the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).
* The most recent release of near client code for StatelessNet is [statelessnet-81.1](https://github.com/near/nearcore/releases/tag/statelessnet-81.0) from 2024-02-06
* Building instructions: you need to build it with the additional argument
```
--features statelessnet_protocol
```
* Sample config: [will be provided shortly]
* Stake: In order to become a validator, you need some tokens. Please fill in the validator form: [the link to the form will be provided shortly].

### 4.2 Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 physical cores

In later stages of StatelessNet we are planning on enabling single shard tracking. The hardware requirements for single shard tracking will be shared then.

## 5. Support channels
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
