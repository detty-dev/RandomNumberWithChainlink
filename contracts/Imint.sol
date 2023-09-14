//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface Imint {
    function mintNFT(address _to, uint256 _tokenId) external;
}