# Reward programs

## Program status update
### June 10, 2024

Stage 3 has started.
TLDR: 
- There's no longer the reward for bug reports. Though, you are still welcome to open the issue [here](https://github.com/near/stakewars-iv/issues/new?template=bug-report.md).
- We no longer accept new traffic generation proposals. We will contact all participants with existing proposals directly.
- Running a validator node reward does not require being an active mainnet validator.

### March 4th, 2024
Evaluation for traffic generation proposals is starting today. As the engineering team is still working on stabilization & optimization of StatelessNet, the team plans to work with the proposer on the actual date that traffic generation will commence (likely to be later part of March). Any additional traffic generation proposals are always welcome. Please have a look at [the program detail](https://github.com/near/stakewars-iv/blob/main/REWARDS.md#3-traffic-generation).

### February 14th, 2024
Bug bounty program is **LIVE** as of February 14th, 2024. If you would like to participate, please make sure to check out [reported issues in stakewars-iv repository with reward-program-bug-bounty label](https://github.com/near/stakewars-iv/issues) and [reported issues with stateless-validation label](https://github.com/near/nearcore/labels/A-stateless-validation) in nearcore repository to avoid duplicate reporting.

## 1. Overview

The Stake Wars IV reward programs are designed to incentivize external participants to collaborate with the Near Protocol team to find potential issues and bugs in the new sharding implementation - the Stateless Validation.

All rewards are distributed in compliance with T&Cs of Near Foundation which includes need for KYC/KYB, check the details [here](NEAR%20Community%20Events%20Terms%20and%20Conditions.pdf).

We invite everyone to participate and help make the Near Protocol better and safer.

### 1.1 Running a validator node with high uptime

Participants who run a validator node with high uptime can be rewarded in NEAR tokens.  
It's required to fill in [Becoming a Validator Proposal](https://github.com/near/stakewars-iv/issues/new?assignees=&labels=&projects=&template=becoming-a-validator-proposal.md&title=), and [the validator form](https://docs.google.com/forms/d/e/1FAIpQLScmgfOdsxV7c5u4fArn79JBf2MBwFqPIqCVU1x0lAYaZoYuxg/viewform).

## 2. Bug bounty [no new proposals accepted]

### 2.1 Overview

While the engineering team is doing their best to make a secure and reliable product, we are all human and things can be overlooked. On mainnet, a bug bounty program has helped identify critical bugs. Having a similar bug bounty program on StatelessNet can reveal issues we are not able to find ourselves. 

### 2.2 Duration

The bug bounty program started at February 14th, 2024, and it will last throughout the entire duration of Stake Wars IV.

### 2.3 Participation guideline

* A participant can study stateless validation code, join the Stake Wars IV network or interact with it to identify failure points and submit bug reports in the stakewars-iv repo using [the provided template](.github/ISSUE_TEMPLATE/bug-report.md);
* A report should be made on [the current GitHub repository](https://github.com/near/stakewars-iv/issues/new). Only the first reporter of a new issue with a valid report will be rewarded.

### 2.4 Reward assessment criteria
* Criticality:
  * P0: Must be fixed before mainnet launch due its impact if exploited. (e.g. can result in monetary damage of others or token minting out of thin air)
  * P1: Not required for the initial launch but should be a blocker for future iterations as it can hinder reliability/scalability (e.g. can cause the chain stall or involuntary validator kickout)
  * P2: Not likely to cause a major issue in the near future but good to have (e.g. short term slow down of block processing time)
  * N/A: Not an issue / Wishlist
* Report completeness
  * High: The report contains the exact code pointers and suggested fix that can be a long term solution
  * Medium: The report contains the exact code pointers and suggested fix that works but either with compromises or is a short term solution
  * Low: The report contains code pointers but the fix is incorrect or cannot be implemented

### 2.5 Multiplier (TBD)
* Criticality
  * P0: 2x
  * P1: 1x
  * P2: 0.75x
  * N/A: 0
* Report completeness
  * High: 1.5x
  * Medium: 1.2x
  * Low: 1x
 
### 2.6 Reward amount
* Baseline reward amount: **150 NEAR**
* Possible reward range: **0 NEAR - 450 NEAR**, depending on quality of a report

### 2.7 Reward calculation example
* Report with exact code pointers and long term solution on the issue with P0 criticality
  * N * 2 * 1.5 = 3N
* Report with code pointers and short term fix on the issue with P1 criticality
  * N * 1 * 1.2 = 1.2N

## 3. Traffic generation [no new proposals accepted]

### 3.1 Overview

Since the mainnet launch, Protocol engineering team has experienced multiple events where unprecedented traffic patterns resulted in different outcomes the team could not think of. Based on such experience, the team concluded that stress testing the network with various traffics can reveal its weakness and things to improve.

On the StatelessNet, a participant can support the effort by generating a creative traffic at large volume that can push various parts of protocol infrastructure to their limits. 

### 3.2 Duration

Stage 2 of stateless validation StatelessNet. 

### 3.3 Participation guideline

* A participant must submit a traffic generation proposal and coordinate with the Protocol engineering team to start the test. While this adds additional burden, this is to make sure that each stress test is properly monitored and does not interfere with one another.
* A proposal should be submitted on [the current GitHub repository](https://github.com/near/stakewars-iv/issues/new) and will be reviewed in order.
* All the participants should follow [the provided template](.github/ISSUE_TEMPLATE/traffic-generation-proposal.md);
* Generated traffic should be notable and original in at least one aspect to be considered eligible for a reward
  * [Note] Detailed TBD on what’s invalid needs to be shared upfront, e.g. Repetitive FT transfer
  * You can check out the following [link](https://github.com/near/nearcore/tree/master/pytest/tests/loadtest/locust#available-load-types) to know more about baseline stress test the team is periodically conducting.

### 3.4 Reward assessment criteria
* Volume (TBD)
  * High: Involves considerable amount of user accounts and/or produces X txn requests/sec
  * Med: Involves reasonable amount of user accounts and/or produces Y txn requests/sec
* Novelty of traffic pattern
  * High: the traffic pattern the protocol engineering team could not think of before
  * Med: the traffic pattern the protocol engineering team discussed in the past, but never tried before
  * Low: the traffic pattern the protocol engineering team tested in the past
* Outcome
  * Success: traffic was successfully generated.
  * Failure: test was failed to be conducted for various reasons (participant unavailability, bug in script, etc)

### 3.5 Multiplier
* Volume:
  * High: 1.5x
  * Med: 1x
* Novelty:
  * High: 1.5x
  * Med: 1x
  * Low: 0.75x
* Outcome:
  * Success: 1x
  * Failure: 0.2x
 
### 3.6 Reward amount
* Baseline reward amount: **500 NEAR**
* Possible reward range: **0 NEAR - 1,125 NEAR**, depending on volume, novelty and outcome of traffic generation attempt.

### 3.7 Reward calculation example
* High volume test with medium novelty of traffic pattern -> test success
  * N * 1.5 * 1 * 1 = 1.5N
* Medium volume test with medium novelty of traffic pattern -> test failure
  * N * 1 * 1 * 0.2 = 0.2N

## 4. Additional reward for top N participants
The top five participants, based on a number of valid reports and proposals, will get **300 NEAR** as a reward for their active participation.

## 5. Running a node with high uptime [ACTIVE]

Participants who run a validator node with high uptime can be rewarded in NEAR tokens. The details for this reward are the following:
* Reward amount: up to 150 NEAR tokens per month per reward. If the period is shorter/longer, the reward will be computed accordingly.
* Number of rewards: 100, based on a first come first served approach: we will offer the rewards in order of the form submissions, to the participants that meet the criteria
* Eligibility criteria:
  * We will reward one StatelessNet node per one person.
  * You need to run a validator node in StatelessNet
  * The node should have an uptime on StatelessNet of >80%. The uptime is calculated as follows: as average of all epoch uptimes, with uptimes as reported by near-cli, on a timeframe from the moment the node joined the active validator set (or June 12 2024 14:00 UTC, whichever is last) until the end of the program (to be announced later).
  * The size of the reward is scaled to the actual start date of running a node. E.g., if a node started running 15 days after the official start date, then the reward would be 75 NEAR less than the reward for the participants who joined in time.
* The rewards will be transferred to the mainnet account id provided in Validator Request Form
* Quitting the program before the end forfeits your right for the reward.

Note: we encourage participants to join the reward program as close to start as they can, to increase the chance of getting into the set of 100 rewards and to be eligible for the full size of the reward.
