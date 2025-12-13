// scripts/deploy.js
// Hardhat script to deploy Timelock and Governor skeleton
const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying with", deployer.address);

  // Parameters
  const minDelay = 60 * 60 * 48; // 48 hours in seconds
  const proposers = []; // will be set later (governor address can be added)
  const executors = []; // zero address means anyone can execute; prefer explicit executors

  const Timelock = await hre.ethers.getContractFactory("CeloHTTimelock");
  const timelock = await Timelock.deploy(minDelay, proposers, executors);
  await timelock.deployed();
  console.log("Timelock deployed:", timelock.address);

  // NOTE: Governor requires an IVotes token. Use an existing voting token address or deploy a mock.
  const voteTokenAddress = process.env.VOTE_TOKEN;
  if (!voteTokenAddress) {
    console.warn("No VOTE_TOKEN provided. Deploy a mock token or set VOTE_TOKEN env var.");
  }

  const Governor = await hre.ethers.getContractFactory("CeloHTGovernor");
  const governor = await Governor.deploy(voteTokenAddress || hre.ethers.constants.AddressZero, timelock.address);
  await governor.deployed();
  console.log("Governor deployed:", governor.address);

  // After deploy, you usually set proposer/executor roles in timelock to governor:
  // const proposerRole = await timelock.PROPOSER_ROLE();
  // await timelock.grantRole(proposerRole, governor.address);
  // const executorRole = await timelock.EXECUTOR_ROLE();
  // await timelock.grantRole(executorRole, deployer.address);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });