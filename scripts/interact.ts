import { ethers } from "hardhat";

async function main() {
    const CHIXAddress = "0x580Ad07fE7F33e655830730fEDDEcb9cD497f894";
    const CHIX = await ethers.getContractAt("ICHIX", CHIXAddress);

   // console.log("==========requesting==========");
    console.log( await CHIX.requestRandomNft({value: ethers.parseEther("0.00001")}));
}


   