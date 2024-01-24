# Reward program

## Overview
The Stake Wars IV reward program is designed to incentivize external participants to collaborate with the Near Protocol team to find any potential issues and bugs in the new sharding implementation - the Stateless Validation. The program is split into two parts - the bug bounty and the traffic generation. We invite everyone to participate and help make the Near Protocol better and safer. 

## Bug bounty
### Overview
While the engineering team is doing their best to make a secure and reliable product, we are all human and things can be overlooked. On mainnet, a bug bounty program has helped identify critical bugs and having a similar bug bounty program on StatelessNet can reveal issues we are not able to find ourselves. 

### Duration
The bug bounty program will start *approximately 2 weeks (Exact date will be updated here)* after the Stake Wars IV launch and it will last throughout the entire duration of Stake Wars IV.

### Participation guideline
* A participant can study stateless validation code, join the Stake Wars IV network or interact with it to identify failure points and submit bug reports in the stakewars-iv repo using the following template: [HERE](bug-reports/template.md) .
* A report should be made on the designated GitHub repository (link TBD) and only the first reporter of a new issue with a valid report will be rewarded
* A report must include the following to be considered for reward
  * Detailed explanation of an issue or a bug 
    * Affected parties
      * Who is affected? Validators? Contract developers? 
    * Impact
      * What’s the worst outcome of the issue?
    * Reproduction steps
* A report may include the following to be considered for a larger reward
  * Root cause analysis with specific code location
  * Suggested fix for the bug or issue

### Reward assessment criteria
* Criticality:
  * P0: Must be fixed before mainnet launch due its impact if exploited. (e.g. can result in monetary damage of others or token minting out of thin air)
  * P1: Not required for the initial launch but should be a blocker for future iterations as it can hinder reliability/scalability (e.g. can cause the chain stall or involuntary validator kickout)
  * P2: Not likely to cause a major issue in the near future but good to have (e.g. short term slow down of block processing time)
  * N/A: Not an issue / Wishlist
* Report completeness
  * High: The report contains the exact code pointers and suggested fix that can be a long term solution
  * Medium: The report contains the exact code pointers and suggested fix that works but either with compromises or is a short term solution
  * Low: The report contains code pointers but the fix is incorrect or cannot be implemented

### Multiplier (TBD)
* Criticality
  * P0: 2x
  * P1: 1x
  * P2: 0.75x
  * N/A: 0
* Report completeness
  * High: 1.5x
  * Medium: 1.2x
  * Low: 1x

### Reward calculation example
* Report with exact code pointers and long term solution on the issue with P0 criticality
  * N * 2 * 1.5 = 3N
* Report with code pointers and short term fix on the issue with P1 criticality
  * N * 1 * 1.2 = 1.2N

## Traffic generation
### Overview
Since the mainnet launch, Protocol engineering team has experienced multiple events where unprecedented traffic patterns resulted in different outcomes the team could not think of. Based on such experience, the team concluded that stress testing the network with various traffics can reveal its weakness and things to improve.

On the StatelessNet, a participant can support the effort by generating a creative traffic at large volume that can push various parts of protocol infrastructure to their limits. 

### Duration
Stage 2 of stateless validation StatelessNet. 

### Participation guideline
* (TBD) A participant must submit a traffic generation proposal and coordinate with the Protocol engineering team to start the test. While this adds additional burden, this is to make sure that each stress test is properly monitored and does not interfere with one another.
* A proposal should be submitted on the designated GitHub repository (link TBD) and will be reviewed in order.
* A proposal must include the following
  * Overview of the test plan and what type of traffic the participant aims to generate.
  * Target traffic volume and required tokens needed to generate the traffic for the agreed time
  * Traffic should be large enough to prove/challenge scalability/stability of the network.
  * Reproduction steps with necessary scripts/codes (in case the engineering team needs to replay in the future)
* Generated traffic should be notable and original in at least one aspect to be considered eligible for a reward
  * [Note] Detailed TBD on what’s invalid needs to be shared upfront, e.g. Repetitive FT transfer

### Reward assessment criteria
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

### Multiplier
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

### Reward calculation example
* High volume test with medium novelty of traffic pattern -> test success
  * N * 1.5 * 1 * 1 = 1.5N
* Medium volume test with medium novelty of traffic pattern -> test failure
  * N * 1 * 1 * 0.2 = 0.2N

## Additional reward for top N participants
The top five participants, based on a number of valid reports and proposals, will get additional reward for their active participation.


