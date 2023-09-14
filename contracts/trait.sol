//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@chainlink/contracts/src/v0.8/mocks/VRTConsumerBase.sol";

contract MyNFTTraitContract is ERC721Enumerable {

constructor(address vrfCoordinator, address _linkToken, bytes32 _keyHash, uint256 _fee)
        ERC721("MyNFT", "NFT")
        VRFConsumerBase(vrfCoordinator, _linkToken)
    {
        keyHash = _keyHash;
        fee = _fee;
    }

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
    
    mapping(uint256 => bool) public mintedTraits;
    
   mapping(uint256 => uint256[6]) public tokenTraits;

    mapping(uint256 => bool) public mintedTokens;

    event transfer(address _to, uint256 _tokenId);

        // Mint function
     function mintNFT(address _to, uint256 _tokenId) public {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK tokens");
        require(LINK.transferFrom(msg.sender, address(this), fee), "Failed to transfer LINK tokens");
       bytes32 requestId = requestRandomness(keyHash, fee);
        mintedTokens[uint256(requestId)] = true;
            require(_to != address(0));
            require(_tokenId < maxTraitValue);
            traits[_tokenId].energy = 0;
            traits[_tokenId].speed = 0;
            traits[_tokenId].strength = 0;
            traits[_tokenId].intelligence = 0;
            traits[_tokenId].agility = 0;
            traits[_tokenId].luck = 0;
            _safeMint(_to, _tokenId);
            requestRandomness(keyHash, _tokenId, fee);    
            emit Transfer(address(0), _to, _tokenId);
            emit Transfer(_to, address(0), _tokenId);
            transferFrom(_to, address(0), _tokenId);
        }
    }
        
    function fullfillRandomness(bytes32 requestId, uint256 payment) public {
            _fulfillRandomness(requestId, payment);
            requestRandomness(keyHash, maxTraitValue, fee);
            uint256 energy =randomness % maxTraitValue;
            randomness /= maxTraitValue;
            uint256 speed =randomness % maxTraitValue;
              randomness /= maxTraitValue;
            uint256 strength =randomness % maxTraitValue;
              randomness /= maxTraitValue;
            uint256 intelligence =randomness % maxTraitValue;
              randomness /= maxTraitValue;
            uint256 agility =randomness % maxTraitValue;
              randomness /= maxTraitValue;
            uint256 luck =randomness % maxTraitValue;
              randomness /= maxTraitValue;
              uint256 tokenId = totalSupply() + 1;
            _safeMint(msg.sender, tokenId);
            tokenTraits[tokenId] = traits;
            traits[requestId] = (energy, speed, strength, intelligence, agility, luck);
        }
}
        


      








