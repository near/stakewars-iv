# NEAR Stake Wars IV: Attack of Transactions

NEAR Protocol is preparing a major update of the core protocol architecture that takes scalability to the next level. This update is called stateless validation, and it has ample impact on how the network operates internally. We invite everyone to join an early access network that runs on this new architecture, StatelessNet, and run a stateless validator node or test the network throughput and scalability.

## Timeline

The entire duration of NEAR Stake Wars IV will be approximately two months, from February till April 2024.
See the detailed timeline [here](TIMELINE.md).

## Participation

While community members can participate in NEAR Stake Wars IV to confirm successful execution of their use cases or simply to fulfill their curiosity, they can also use the opportunity to earn NEAR tokens by participating in the reward program.

The instruction for the participants can be found [here](HOW_TO.md), technical details are [here](TECHNICAL_DETAILS.md).

More details about the rewards can be found [here](REWARDS.md).

## StatelessNet is running

February 1st, 2024. StatelessNet was started and currently running with 5 validator nodes, RPC and Archival nodes. Over the next few days we will gradually expand it and begin sending meaningful traffic to it.

As a quick overview of the network, you can use the following resources:
* [StatelessNet Dashboard](https://nearinc.grafana.net/public-dashboards/451b4c15175b476a9fb00953de40f848)
* List of current RPC nodes: 
  * `https://rpc.statelessnet.near.org`
  * `https://archival-rpc.statelessnet.near.org`

You can add `/metrics` after the RPC URLs to access a web page with RPC metrics.

Creating an account on StatelessNet will be done via an automated web service, that will be available shortly.
Until then, you can use [the form to request an account](https://forms.gle/b9qg8Pgp2oLJPwq78), and we will generate one for you within a day.

## StatelessNet status

#### February 2nd, 2024

We added [the instruction](HOW_TO.md) how to create the account and how to use the network.

#### February 1st, 2024

StatelessNet was started, and nodes are running. We noticed an issue impacting block finality and we are currently investignating it and working on a fix. This issue causes blocks to be missed, kickin out validator nodes. During Stage 1 of Stake Wars IV we expect to find issues what were not previously reproduced,  and to iterate quickly in fixing them and updating the nodes.
