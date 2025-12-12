![Image](https://github.com/user-attachments/assets/8c59e434-db05-47e4-8e86-2d3d35d83af3)

# CeloHT DAO Governance

## Mission
Enable collective decision-making on the direction of CeloHT while protecting community resources and increasing impact across the three pillars: Education, Agents, Reforestation.

## Roles

### Founder & CEO: Johnny Dubic
- **Responsibilities:** strategic vision, partnerships, initiating proposals.  
- **Limits:** no veto power; cannot touch treasury without a passed vote; no private admin access to financial contracts.

### Community Members
- Participate in voting, proposal creation, review, and program execution.

### Stewards / Guardians
- Multisig stewards for emergency cases only (not for regular decisions without a vote).

## Voting Parameters (Suggested)
- **Quorum:** 2% voting power (adjustable via governance)  
- **Passing Threshold:** more than 50% of votes cast  
- **Voting Period:** 3–7 days  
- **Timelock Delay:** 48–72 hours (default)

## Treasury
- **Custody:** Gnosis Safe multisig (3/5 or 4/7)  
- **Assets:** cUSD, CELO, and other community-approved stable assets  
- **Transfers:** only executed after a passed proposal + timelock + execution step

## Proposal Lifecycle
1. Draft (`PROPOSALS/000-template.md`)  
2. Off-chain signaling (Snapshot)  
3. On-chain proposal (Governor)  
4. If passed → Queue in Timelock  
5. Execute after timelock expires

## Security & Audits
- All deployed treasury-related code must pass an external audit before mainnet.  
- Bug bounty and responsible disclosure programs are required.
