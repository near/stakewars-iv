# How to join StatelessNet?

## 1. RPC and archival nodes

Available RPC and archival nodes:
* `https://rpc.statelessnet.near.org`
* `https://archival-rpc.statelessnet.near.org`

## 2. Required tools

### 2.1 `near-cli`, `near-cli-rs`
At first, we need to install both [near-cli](https://docs.near.org/tools/near-cli) and [near-cli-rs](https://docs.near.org/tools/near-cli-rs).
They are not similar, and having both of them will slightly simplify the process for you.  
Both of them will try to use the same name `near`.
Let's solve this issue:
```bash
npm install -g near-cli
cd /usr/local/bin
sudo mv near near-js
cargo install near-cli-rs
sudo ln -s ~/.cargo/bin/near ./near
```

If you have any issues during the installation, it's better to check the documentation of [near-cli](https://docs.near.org/tools/near-cli) and [near-cli-rs](https://docs.near.org/tools/near-cli-rs).

In the examples below, we use `near` for [near-cli-rs](https://docs.near.org/tools/near-cli-rs), and `near-js` for [near-cli](https://docs.near.org/tools/near-cli).

### 2.2 Adding the network

```bash
near config add-connection --network-name statelessnet --connection-name statelessnet --rpc-url https://rpc.statelessnet.near.org/ --wallet-url https://rpc.statelessnet.near.org/ --explorer-transaction-url https://rpc.statelessnet.near.org/
```
*Only RPC URL is provided correctly in this command, but it's fine because it's the only URL we will use further.*

## 3. Create an account on StatelessNet

There is no wallet developed for StatelessNet. Account creation is handled via a web serivce (available [here](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/)) and interaction with the account is later done via near-cli.

In order to use the [web service for creating the account](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/), you need to provide two things: (1) an account name and (2) a public key.
1. Account name: the account name has to be in the format `<your-account-name>.statelessnet`, and has to respect the NEAR [account ID rules](https://nomicon.io/DataStructures/Account#account-id-rules). Note that StatelessNet does NOT support [implicit accounts](https://nomicon.io/DataStructures/Account#implicit-account-ids).
2. Public key (part of a private/public key pair):
   Using near-cli-rs, this command will generate the keys:
```bash
near account create-account fund-later use-auto-generation save-to-folder ./<your-account-name>.statelessnet
```
The name here (`<your-account-name>.statelessnet`) is just for file naming and doesn't need to match any specific account.

Locate the public key: find the file `<your-account-name>.statelessnet` in the specified folder. Open the file. The public key is found under `public_key` and looks like `ed25519:....` Copy all the string of the key, including the "`ed25519:`" part.

Enter the account name and the public key in the web service page, press "Create Account" and your account will be automatically created.
You'll also receive 10 StatelessNet tokens for all your experiments which is enough for any type of manual testing.

If 10 StatelessNet tokens is not enough for your experiments, be ready to create the [Traffic Generation Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=traffic-generation-proposal.md&title=), and then fill in [the form](https://docs.google.com/forms/d/e/1FAIpQLSf8auAbg7KbcBaWG-u69T0UjsXszqyBL4bKMU2m5gK9QX7pXA/viewform).

#### Notes
* StatelessNet is a sandbox created for testing purposes, concentrating both on correctness and performance.
* StatelessNet will be initiated with a copy of mainnet state.
* In the future the protocol team may enable mirroring mainnet traffic in StatelessNet.
* It means that all the existing mainnet accounts would be already occupied.
* StatelessNet will not affect the activity on mainnet in any case.

## 4. How to run read-only node?

### 4.1 Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 physical cores

In later stages of StatelessNet we are planning on enabling single shard tracking. The hardware requirements for single shard tracking will be shared then.

### 4.2 Instruction

This is a short version inspired by the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).

```bash
# Install some basic stuff
sudo apt update
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python3 docker.io protobuf-compiler libssl-dev pkg-config clang llvm cargo awscli

# Clone the repo, choose the needed branch
git clone https://github.com/near/nearcore
cd nearcore/
git checkout statelessnet_latest

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup -V

# Build the code
cargo build --package neard --features statelessnet_protocol --release

# Copy the DB Snapshot
mkdir ~/.near/data
cd ~/.near/data
aws s3 --no-sign-request cp s3://near-protocol-public/backups/statelessnet/rpc/latest .
latest=$(cat latest)
aws s3 --no-sign-request cp --recursive s3://near-protocol-public/backups/statelessnet/rpc/$latest .

# Initialise the working directory
./target/release/neard --home ~/.near init --chain-id statelessnet
```

Then, you need to fix `.near/config.json` a little, changing 2 lines in the beginning of the file:
```
  "genesis_file": "data/genesis.json",
  "genesis_records_file": "data/records.json",
```

We are almost there. It takes around 5-7 minutes to operate normally
```bash
cd ~/nearcore/
./target/release/neard --home ~/.near run
```

## 5. How to become a validator?

*This section is work in progress. We will update it soon with a more crisp description for how to run a node.*

### 5.1 Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 physical cores

In later stages of StatelessNet we are planning on enabling single shard tracking. The hardware requirements for single shard tracking will be shared then.

### 5.2 Basic instructions

* Compiling and running a near node is detailed in the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).
* The most recent release of near client code for StatelessNet is [statelessnet-81.1](https://github.com/near/nearcore/releases/tag/statelessnet-81.1) from 2024-02-06
* Building instructions: you need to build it with the additional argument
```
--features statelessnet_protocol
```
* Sample config: [will be provided shortly]
* Stake: In order to become a validator, you need some tokens. Please create [Becoming a Validator Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=becoming-a-validator-proposal.md&title=), and then fill in [the validator form](https://docs.google.com/forms/d/e/1FAIpQLScmgfOdsxV7c5u4fArn79JBf2MBwFqPIqCVU1x0lAYaZoYuxg/viewform).

## 6. Support channels
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
