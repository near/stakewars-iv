# How to join StatelessNet?

## 1. RPC and archival nodes

Available RPC and archival nodes:
* `https://rpc.statelessnet.near.org`
* `https://archival-rpc.statelessnet.near.org`

## 2. Required tools

### 2.1 `near-cli`
To install [near-cli](https://docs.near.org/tools/near-cli) we simply need to run: `npm install -g near-cli`. If you have any issues during the installation, please check the [official documentation](https://docs.near.org/tools/near-cli)

### 2.2 Setting up the network
We will be using a network different from `testnet` and `mainnet`, for which we need to setup a specific `RPC`

```bash
export NEAR_CUSTOM_RPC=https://rpc.statelessnet.near.org/
```

## 3. Create an account on StatelessNet

There is no wallet developed for StatelessNet. Account creation is handled via a web sevice (available [here](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/)) and interaction with the account is later done via near-cli.

In order to use the [web service for creating the account](https://sw4-account-creator-g55a3i3lmq-ey.a.run.app/), you need to provide two things: (1) an account name and (2) a public key.

Choose an account name ([account ID rules](https://nomicon.io/DataStructures/Account#account-id-rules)) and use `near-cli` to generate local credentials:

```bash
near generate-key <your-account-name>.statelessnet --networkId custom
```

This will print a `keyPair` in the console with the `publicKey` and `secretKey`. These values will also be saved on the key file in `~/.near-credentials/custom/<your-account-name>.statelessnet.json`. Open the file. The public key is found under `public_key` and looks like `ed25519:....` Copy all the string of the key, including the "`ed25519:`" part.

Enter the account name and the public key in the web service page, press "Create Account" and your account will be automatically created.

You'll also receive 10 StatelessNet tokens for all your experiments which is enough for any type of manual testing.

If 10 StatelessNet tokens is not enough for your experiments, be ready to create the [Traffic Generation Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=traffic-generation-proposal.md&title=), and then fill in [the form](https://docs.google.com/forms/d/e/1FAIpQLSf8auAbg7KbcBaWG-u69T0UjsXszqyBL4bKMU2m5gK9QX7pXA/viewform).

#### Notes
* StatelessNet is a sandbox created for testing purposes, concentrating both on correctness and performance.
* StatelessNet will be initiated with a copy of mainnet state.
* In the future the protocol team may enable mirroring mainnet traffic in StatelessNet.
* It means that all the existing mainnet accounts would be already occupied.
* StatelessNet will not affect the activity on mainnet in any case.

## 4. How to run a node?

### 4.1 Hardware requirements

Assuming the heaviest setup where a node tracks all shards and stores all shards in memory:
- 1TB disk
- 32GB RAM
- 8 physical cores

In later stages of StatelessNet we are planning on enabling single shard tracking. The hardware requirements for single shard tracking will be shared then.

### 4.2 Read-only node instruction

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

Then, replace `.near/config.json` with [the new file](config.json), and we are almost there.
It takes around 5-7 minutes to operate normally

```bash
cd ~/nearcore/
./target/release/neard --home ~/.near run
```

### 4.3 Validator instruction

Same as before, this instruction is inspired by the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).
You may search for more detailed information there.

In order to become a validator, you need to go through [previous step](HOW_TO.md#42-read-only-node-instruction) at first.

Also, you need some tokens. Please create [Becoming a Validator Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=becoming-a-validator-proposal.md&title=), and fill in [the validator form](https://docs.google.com/forms/d/e/1FAIpQLScmgfOdsxV7c5u4fArn79JBf2MBwFqPIqCVU1x0lAYaZoYuxg/viewform).


#### Updating `validator_key.json`

Then, you need to update your `~/.near/validator_key.json` file.
It should contain the following fields:
```json
{
   "account_id": "your-account.statelessnet",
   "public_key": "ed25519:...",
   "secret_key": "ed25519:..."
}
```

You have everything needed in the file you saw after the creation of your account.
`secret_key` corresponds to `private_key`.

#### Staking the StatelessNet tokens

We decided to keep everything simple, there are no staking pools for now.

```bash
near stake <your-account-id.statelessnet> <your-public-key-without-ed25519:> <your-amount> --networkId custom
```

Minimal amount is also known as the seat price, which can be found by the command

```bash
near validators next --networkId custom
```

#### Restarting the node

We need to help node see the new `validator_key.json` file.

And voilà! After 2 epochs, if everything was fine, you should be a validator.

### 4.4 Check the status

You can check the current list of the validators with [near-cli](https://docs.near.org/tools/near-cli):

```bash
near validators current --networkId custom
```

There's also a list for the next epoch:

```bash
near validators next --networkId custom
```

And for the epoch after the next:

```bash
near validators proposals --networkId custom
```

So, if you wait to be included into the validators list, your username should gradually appear in the responses from the last to the first command.

## 5. Common Errors
Please make sure to define the `NEAR_CUSTOM_RPC`, and to add the `--networkId custom` flag to all commands!

```bash
export NEAR_CUSTOM_RPC=https://rpc.statelessnet.near.org/
```

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
