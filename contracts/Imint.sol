//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;



interface ICHIX {
    function requestRandomNft() external payable returns (uint256 Id);

    function setTokenURI(uint _ttokenID, string memory tokenUri) external;
}