// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// creator: 0xfcdD51DC8B2510bCFb343236042fb36A9d79Ac33

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract delegateMintERC721 is ERC721 {
    uint256 public _tokenId;

    modifier onlyMinter(address _minter) {
        require(_minter == address(0xfcdD51DC8B2510bCFb343236042fb36A9d79Ac33), "Not allowed minter");
        _;
    }

    constructor() ERC721("Web3 Online Judge NFT", "WEB3OJNFT") {
    }

    function mint(address to) public onlyMinter(msg.sender) {
        _mint(to, _tokenId);
        _tokenId++;
    }
}

// forge create ./src/delegateMintERC721-2.sol:delegateMintERC721 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
// cast send $instance --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "setToken(address _token)" $my_contract
