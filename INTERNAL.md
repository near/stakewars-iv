# How to set up new network

[If you are a community member, you don't need this instruction!]

This instruction may be useful for the future Stake Wars launches.

Please read the command before applying, it may require some adjustments.

```bash
# Install near-cli-rs
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/near/near-cli-rs/releases/latest/download/near-cli-rs-installer.sh | sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/near-cli-rs/near-validator-cli-rs/releases/latest/download/near-validator-installer.sh | sh
source $HOME/.cargo/env

# Set up new network
near config add-connection --network-name statelessnet --connection-name statelessnet --rpc-url https://rpc.statelessnet.nearone.org/ --wallet-url https://rpc.statelessnet.nearone.org/ --explorer-transaction-url https://rpc.statelessnet.nearone.org/

# Go and find the keys for the root account (it's `statelessnet` this time)
# Import root account. Using legacy keychain will simplify the process
near account import-account using-private-key ed25519:... network-config statelessnet

# Create your account and send some tokens to it
near account create-account fund-myself olga.statelessnet '1000 NEAR' autogenerate-new-keypair save-to-legacy-keychain sign-as statelessnet network-config statelessnet sign-with-legacy-keychain send

# Create accounts for whitelisting and pool factory
near account create-account fund-myself whitelist.statelessnet '10 NEAR' autogenerate-new-keypair save-to-legacy-keychain sign-as statelessnet network-config statelessnet sign-with-legacy-keychain send
near account create-account fund-myself pool.statelessnet '10 NEAR' autogenerate-new-keypair save-to-legacy-keychain sign-as statelessnet network-config statelessnet sign-with-legacy-keychain send

# Download wasm files from mainnet
near contract download-wasm poolv1.near save-to-file pool.wasm network-config mainnet now
near contract download-wasm lockup-whitelist.near save-to-file whitelist.wasm network-config mainnet now

# Deploy and initialize the whitelisting and pool factory contracts
near contract deploy whitelist.statelessnet use-file whitelist.wasm with-init-call new json-args '{"foundation_account_id": "statelessnet"}' prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' network-config statelessnet sign-with-legacy-keychain send
near contract deploy pool.statelessnet use-file pool.wasm with-init-call new json-args '{"staking_pool_whitelist_account_id": "whitelist.statelessnet"}' prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' network-config statelessnet sign-with-legacy-keychain send

# Whitelist the pool factory contract
near contract call-function as-transaction whitelist.statelessnet add_factory json-args '{"factory_account_id": "pool.statelessnet"}' prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' sign-as statelessnet network-config statelessnet sign-with-legacy-keychain send

# Find the public key for staking pool
cat ~/.near/validator_key.json

# Create the staking pool
near transaction construct-transaction olga.statelessnet pool.statelessnet add-action function-call create_staking_pool json-args '{"staking_pool_id": "olga", "owner_id": "olga.statelessnet", "stake_public_key": "ed25519:...", "reward_fee_fraction": {"numerator": 10, "denominator": 100}}' prepaid-gas '300.0 Tgas' attached-deposit '35 NEAR' skip network-config statelessnet sign-with-legacy-keychain send

# Just some checks if everything is all right
near contract call-function as-read-only olga.pool.statelessnet get_total_staked_balance json-args {} network-config statelessnet now
near contract call-function as-read-only olga.pool.statelessnet get_owner_id json-args {} network-config statelessnet now

# Sending some tokens + staking
near tokens statelessnet send-near olga.statelessnet '1000000 NEAR' network-config statelessnet sign-with-legacy-keychain send
near staking delegation olga.statelessnet deposit-and-stake '1000000 NEAR' olga.pool.statelessnet network-config statelessnet sign-with-legacy-keychain send
```

Then you need to return to [general instruction](HOW_TO.md) and set up the node.
