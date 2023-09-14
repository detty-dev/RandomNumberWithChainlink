import { ethers } from "hardhat";


async function main(){
  const MyNFTContract = await ethers.getContractAt('MyNFT', []);
  const [owner, addr1, addr2] = await ethers.getSigners();
  const keyHash = 'YOUR_KEY_HASH'; // Replace with your Chainlink VRF key hash
  const fee = ethers.parseEther('0.1'); // Replace with your Chainlink VRF fee

  beforeEach(async () => {
   const  [owner, addr1, addr2] = await ethers.getSigners();
    const MyNFTFactory = await ethers.getContractFactory('MyNFT', owner);
    const MyNFTContract = (await MyNFTFactory.deploy(
      'VRFCoordinatorV2 Address',
      'LinkToken Address',
      keyHash,
      fee
    )) MyNFT;
    await MyNFTContract.deployed();
 });

  it('Should mint an NFT with traits', async () => {
    const tx = await MyNFTContract.connect(addr1).mintNFT();
    await tx.wait();

    const tokenId = await MyNFTContract.tokenOfOwnerByIndex(addr1.getAddress(), 0);
    const traits = await MyNFTContract.tokenTraits(tokenId);

    const  Trait =await (traits).to.have.lengthOf(6);
    // Add more assertions based on your trait generation logic.
  });

  it('Should mint an NFT with specified traits', async () => {
    const traits = [10, 20, 30, 40, 50, 60];

    const tx = await MyNFTContract.connect(addr1).mintNFT(traits);
    await tx.wait();
    //console.log (tx);

    const tokenId = await MyNFTContract.tokenOfOwnerByIndex(addr1.getAddress(), 0);
    const storedTraits = await MyNFTContract.tokenTraits(tokenId);

    const Trait =await(storedTraits).to.deep.equal(traits);
  });

}
// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});