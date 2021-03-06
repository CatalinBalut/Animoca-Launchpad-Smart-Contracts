// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

import "@openzeppelin/contracts/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract WhitelistSale is ERC721 {
    bytes32 public merkleRoot;
    uint256 public nextTokenId;
    mapping(address => bool) public claimed;

    constructor(bytes32 _merkleRoot) ERC721("ExampleNFT", "NFT") {
        merkleRoot = _merkleRoot;
    }

    mapping(address => bytes32) MerkleRoots;

    function mint(bytes32[] calldata merkleProof) public payable {
        require(claimed[msg.sender] == false, "already claimed");
        claimed[msg.sender] = true;
        require(
            MerkleProof.verify(
                merkleProof,
                merkleRoot,
                keccak256(abi.encodePacked(msg.sender))
            ),
            "invalid merkle proof"
        );
        nextTokenId++;
        _mint(msg.sender, nextTokenId);
    }
}
