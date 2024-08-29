// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract myERC721contract is ERC721 {
    uint256 public _tokenIds;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor() ERC721("Web3 Online Judge NFT", "WEB3OJNFT") {
        owner = msg.sender;
    }

    function mintNFT(address recipient) public onlyOwner returns (uint256){
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _tokenIds++;

        return newItemId;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://app.web3oj.com/web3ojnft/";
    }

    function myERC721Approve(address _to, uint256 _tokenId) public {
        approve(to, tokenId);
    }
}
