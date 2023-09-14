//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@chainlink/contracts/src/v0.8/mocks/VRTConsumerBase.sol";

contract myNFT is ERC721Enumerable, VRTConsumerBase {
    uint256 public constant maxTraitValue =100;
    bytes internal keyHash;
    uint256 internal fee;

    struct Trait {
        uint256 randomword;
        uint256 energy;
        uint256 speed;
        uint256 strength;
        uint256 intelligence;
        uint256 agility;
        uint256 luck;
        uint fee;
    }
    address constant linkToken= "0x326C977E6efc84E512bB9C30f76E30c160eD06FB";
    address constant vrfwrappperAddress= "";
    mapping(uint256 => Trait) public traits;

  













































//     constructor(address _VRFCoordinator, address _LinkToken, bytes _keyhash)
//         ERC721 ("mynft", "mynft"), 
//         VRFConsumerBase(_VRFCoordinator, _LinkToken)
//     {
//         keyHash = _keyhash;
//         fee = 0.1 * 10 ** 18;
//     }
//         function mint(address _to, uint256 _tokenId) public {
//             require(_to != address(0));
//             require(_tokenId < maxTraitValue);
//             traits[_tokenId].energy = 0;
//             traits[_tokenId].speed = 0;
//             traits[_tokenId].strength = 0;
//             traits[_tokenId].intelligence = 0;
//             traits[_tokenId].agility = 0;
//             traits[_tokenId].luck = 0;
//             _safeMint(_to, _tokenId);
//             requestRandomness(keyHash, _tokenId, fee);    
//             emit Transfer(address(0), _to, _tokenId);
//             emit Transfer(_to, address(0), _tokenId);
//             transferFrom(_to, address(0), _tokenId);
//         }

//         function fullfillRandomness(bytes32 requestId, uint256 payment) public {
//             _fulfillRandomness(requestId, payment);
//             requestRandomness(keyHash, maxTraitValue, fee);
//             uint256 energy =randomness % maxTraitValue;
//             randomness /= maxTraitValue;
//             uint256 speed =randomness % maxTraitValue;
//               randomness /= maxTraitValue;
//             uint256 strength =randomness % maxTraitValue;
//               randomness /= maxTraitValue;
//             uint256 intelligence =randomness % maxTraitValue;
//               randomness /= maxTraitValue;
//             uint256 a gility =randomness % maxTraitValue;
//               randomness /= maxTraitValue;
//             uint256 luck =randomness % maxTraitValue;
//               randomness /= maxTraitValue;
//             emit RandomnessFulfilled(energy, speed, strength, intelligence, agility, luck);
//             traits[requestId] = Trait(energy, speed, strength, intelligence, agility, luck);
//         }


// }