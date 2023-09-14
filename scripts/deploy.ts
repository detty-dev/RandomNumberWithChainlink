import { ethers } from "hardhat";


async function main(){
  const LinkToken = "0x326c977e6efc84e512bb9c30f76e30c160ed06fb"
  const keyHash = '0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15'; 
  const VRFCoordinate = "0x2ca8e0c643bde4c2e08ab1fa0da3401adad7734d"
  const maxFeePerGas = ethers.parseUnits('100', 'gwei');
  const chainAddress = "0x580Ad07fE7F33e655830730fEDDEcb9cD497f894";  
  const fee = ethers.parseEther('0.1');    
                    
       const[owner, addr1, addr2] = await ethers.getSigners();
       const MyNFTFactory = await ethers.getContractAt('MyNFTTraitContract', owner);
       const MyNFTContract = (await MyNFTFactory.deploy(
            'VRFCoordinatorV2 Address',
            'LinkToken Address',
            keyHash,
            fee
          )) ;
          await MyNFTContract.waitForDeployment();
          console.log(MyNFTContract.target);
                   
          }     
      main().catch((error) => {
          console.error(error);
          process.exit(1);
        });
     