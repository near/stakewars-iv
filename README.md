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

You can add `/metrics` after the RPC URLs to access a web page with RPC metrics.

## 4. StatelessNet status

#### February 2nd, 2024

We added [instructions](HOW_TO.md) on how to create an account on StatelessNer and how to use the network.

#### February 1st, 2024

StatelessNet was started, and nodes are running. We noticed an issue impacting block finality and we are currently investignating it and working on a fix. This issue causes blocks to be missed, kickin out validator nodes. During Stage 1 of Stake Wars IV we expect to find issues what were not previously reproduced,  and to iterate quickly in fixing them and updating the nodes.
