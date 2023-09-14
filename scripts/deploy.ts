import { ethers } from "hardhat";                 
  
  async function main() {
    const mintAmount = ethers.parseEther("0.000001");
  
    const traitContract = await ethers.deployContract("MyNFTContract");
  
    await  traitContract .waitForDeployment();
  
    console.log(
      `CHIX deployed to ${traitContract.target}`
    );
  }
  
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
     