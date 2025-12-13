const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("CeloHT Governor basic", function () {
  it("deploys timelock and governor", async function () {
    const [deployer] = await ethers.getSigners();

    const Timelock = await ethers.getContractFactory("CeloHTTimelock");
    const timelock = await Timelock.deploy(60, [], []);
    await timelock.deployed();

    const MockVotes = await ethers.getContractFactory("ERC20VotesMock");
    const token = await MockVotes.deploy("Mock", "MCK", deployer.address, ethers.utils.parseEther("1000"));
    await token.deployed();

    const Governor = await ethers.getContractFactory("CeloHTGovernor");
    const governor = await Governor.deploy(token.address, timelock.address);
    await governor.deployed();

    expect(await governor.name()).to.equal("CeloHT Governor");
  });
});