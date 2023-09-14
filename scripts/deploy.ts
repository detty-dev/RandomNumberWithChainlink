import { ethers } from "hardhat";

async function main() {
  const MYNFT = await ethers. getContractAt("MyNFT", "0x5FbDB2315678afecb367f032d93F642f64180aa3");
  const lock = await ethers.deployContract("VRFCoordinator", [], {

  });

  await lock.waitForDeployment();

  console.log(
    ` deployed to ${lock.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
