# How to join StatelessNet?

## 1. RPC and archival nodes

Available RPC and archival nodes:
* `https://rpc.statelessnet.nearone.org`
* `https://archival-rpc.statelessnet.nearone.org`

## 2. Required tools

### 2.1 `near-cli` 
```bash
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/near/near-cli-rs/releases/latest/download/near-cli-rs-installer.sh | sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/near-cli-rs/near-validator-cli-rs/releases/latest/download/near-validator-installer.sh | sh
source $HOME/.cargo/env
```

### 2.2 Setting up the network
We will be using a network different from `testnet` and `mainnet`, for which we need to setup a specific `RPC`

```bash
near config add-connection --network-name statelessnet --connection-name statelessnet --rpc-url https://rpc.statelessnet.nearone.org/ --wallet-url https://rpc.statelessnet.nearone.org/ --explorer-transaction-url https://rpc.statelessnet.nearone.org/
```

The command above will ask you some questions - just pick "No" or "I don't know" options each time.

## 3. Create an account on StatelessNet

There is no wallet developed for StatelessNet. Account creation is handled via a [web service](https://account.statelessnet.nearone.org) and interaction with the account is later done via near-cli.

In order to use the [web service for creating the account](https://account.statelessnet.nearone.org), you need to provide two things: (1) an account name and (2) a public key.

Choose an account name ([account ID rules](https://nomicon.io/DataStructures/Account#account-id-rules)) and use `near-cli` to generate local credentials:

```bash
near account create-account fund-later use-auto-generation save-to-folder ~/.near-credentials/statelessnet
```

Check the contents of the resulting file.
Copy all the string of the `public_key` value, including the "`ed25519:`" part.

Enter the account name and the public key in the web service page, press "Create Account" and your account will be automatically created.

You'll receive 60 StatelessNet tokens for all your experiments which is enough for any type of manual testing.
It's also enough to create staking pool if you wish to become a validator.

It would be useful to import the resulting account into `near-cli` we installed earlier:
```bash
near account import-account using-private-key ed25519:... network-config statelessnet
```

Since we have testing purposes, and we don't care too much about the security, I suggest using legacy keychain, it will simplify the process.

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

### 4.2 Read-only node instruction

This is a short version inspired by the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).

```bash
# Install some basic stuff
sudo apt update
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python3 docker.io protobuf-compiler libssl-dev pkg-config clang llvm awscli tmux jq

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
mkdir -p ~/.near/data
cd ~/.near/data
aws s3 --no-sign-request cp s3://near-protocol-public/backups/statelessnet/rpc/latest .
latest=$(cat latest)
aws s3 --no-sign-request cp --recursive s3://near-protocol-public/backups/statelessnet/rpc/$latest .

# Initialise the working directory
~/nearcore/target/release/neard --home ~/.near init --chain-id statelessnet

# Replacing the config file
cd ~/.near
rm config.json
wget https://raw.githubusercontent.com/near/stakewars-iv/main/config.json
```

```bash
cd ~/nearcore/
./target/release/neard --home ~/.near run
```

It takes around 5-7 minutes to operate normally, you need to ignore all the errors during this time.

### 4.3 Validator instruction

Same as before, this instruction is inspired by the [NEAR validators documentation](https://near-nodes.io/validator/compile-and-run-a-node).
You may search for more detailed information there.

In order to become a validator, you need to go through [previous step](HOW_TO.md#42-read-only-node-instruction) at first.

Also, if you are [eligible for the validator rewards](REWARDS.md), please create [Becoming a Validator Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=becoming-a-validator-proposal.md&title=), and fill in [the validator form](https://docs.google.com/forms/d/e/1FAIpQLScmgfOdsxV7c5u4fArn79JBf2MBwFqPIqCVU1x0lAYaZoYuxg/viewform).

#### Staking the StatelessNet tokens

You need to create staking pool.
You need 35 Statelessnet tokens to perform this operation.

```bash
near transaction construct-transaction your-account.statelessnet pool.statelessnet add-action function-call create_staking_pool json-args '{"staking_pool_id": "your-id", "owner_id": "your-account.statelessnet", "stake_public_key": "ed25519:your-validator-key", "reward_fee_fraction": {"numerator": 10, "denominator": 100}}' prepaid-gas '300.0 Tgas' attached-deposit '35 NEAR' skip network-config statelessnet sign-with-legacy-keychain send
```

* `staking_pool_id` is a prefix for your pool. If you pass there `apple`, your pool will be `apple.pool.statelessnet`
* `stake_public_key` can be found at `.near/validator_key.json`

#### Updating `validator_key.json`

Then, you need to update your `~/.near/validator_key.json` file.
It should contain the following fields:
```json
{
   "account_id": "your-id.pool.statelessnet",
   "public_key": "ed25519:...",
   "secret_key": "ed25519:..."
}
```

If you followed the instruction, do not change the public and secret keys, they are already set up correctly.
You just need to update `account_id` with your pool account id.

#### Restarting the node

We need to help node see the new `validator_key.json` file.
If you changed anything there, please restart your node.

Then, it's a core's team responsibility to stake into your pool.
We review the list of active pools at least once a day.
If your pool is ignored for more than one day, please ping us on [Telegram](https://t.me/near_stake_wars).

And voilà! After 2 epochs, if everything is fine, you should be a validator.

### 4.4 Check the status

You can check the current list of the validators with [near-cli](https://docs.near.org/tools/near-cli-rs):

```bash
near-validator validators network-config statelessnet now
```

There's also a list for the next epoch:

```bash
near-validator validators network-config statelessnet next
```

And for the epoch after the next:

```bash
near-validator proposals network-config statelessnet
```

So, if you wait to be included into the validators list, your username should gradually appear in the responses from the last to the first command.

### Node update

You may see the error like this
```
The client protocol version is older than the protocol version of the network. Please update nearcore. 
```

It means you need to get the fresh version of the code:
```bash
cd ~/nearcore/
git pull
cargo build --package neard --features statelessnet_protocol --release
./target/release/neard --home ~/.near run
```

If you were a validator before, the core team staked some funds, and you were kicked out after that, you probably want to continue validating after you solved the issues with the node.
For that, stake any amount to your pool or just call `ping`:

```bash
near contract call-function as-transaction your-id.pool.statelessnet ping json-args {} prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' sign-as your-account.statelessnet network-config statelessnet sign-with-legacy-keychain send
```

Then, check if your proposal was accepted.

```bash
near-validator proposals network-config statelessnet
```

If you are on this list, you should be a validator again in 2 epochs.

An automation script for checking the updates is available [here](update_neard.sh).

### 4.5 Pinging

If your node is accidentally kicked out, and it's not your fault (it's running fine, there are no issues with the node itself), it's better to return it back ASAP.  
The easiest way to do this is to create a cron job which pings your pool at least once on each epoch.
The statelessnet epoch is 5000 blocks, it's a little less than 1.5 hours, so let's ping it once an hour.

```bash
cd /bin/
wget https://raw.githubusercontent.com/near/stakewars-iv/main/ping.sh
which near
```

Open this file and change 3 things:
- Path to `near` (copy-paste it from `which near` command above)
- Your account id
- Your staking pool account id

Then, let's make it executable and add a cronjob
```bash
chmod +x ping.sh
crontab -e
```

Choose your preferred editor and add this line to the end of the file
```text
0 * * * * /bin/ping.sh > /bin/file.txt 2>&1
```

Nice, your contract will be pinged each hour.  
Keep in mind it will not help with the uptime if your node does not feel good.
You will have to check its state manually from time to time.

## 6. Support channels
To maximize transparency throughout the process and provide timely support for the community, multiple support channels will be set up, including Github, Near.org, X, Telegram, and Zulip. At the high level, each channel will be used for the following purposes.

### [GitHub for reward program](https://github.com/near/stakewars-iv/issues)
Users can submit a bug/issue report to the GitHub repository created specifically for StatelessNet. This will be the main channel for reward program participants to share reports.

### [Near.org for detailed status update](https://near.org/mob.near/widget/ProfilePage?accountId=stake-wars.near)
Pagoda/Near Foundation will share detailed StatelessNet status updates and progress reports with community members.

### [X (Ex-Twitter) for high level status update](https://twitter.com/NearStakeWars)
Along with Near.org, Pagoda/Near Foundation will share a brief summary of the StatelessNet status updates and progress reports with community members.

### [Telegram for general Q&A and communication with participants](https://t.me/near_stake_wars)
Pagoda/Near Foundation will maintain telegram channels for each participant type (e.g. validator, smart contract developer, reward program participant) to answer questions and share important updates that may require timely action, such as binary update request for participating nodes in the StatelessNet network.

### [Zulip for technical support](https://near.zulipchat.com/#narrow/stream/422293-pagoda.2Fcore.2Fstake-wars-iv/)
Users can ask technical questions or request technical support from protocol engineering team.
