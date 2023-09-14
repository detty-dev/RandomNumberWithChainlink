import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import 'dotenv/config';

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  networks: {
    goerli: {
      url:process.env.GOERLIRPC,
      // @ts-ignore
      accounts:[process.env.PRIVATEKEY]
    },
    hardhat: {
      forking: {
        url: "https://eth-goerli.g.alchemy.com/v2/vdXdDSTynYGNzCMVRHi8CdxI2W6nWJyV"
      }
      }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};

export default config;
