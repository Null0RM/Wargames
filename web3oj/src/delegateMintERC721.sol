// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// creator: 0xa8495f277B09516097F395bc0d263c6dB2F5399f

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract delegateMintERC721 is ERC721 {
    modifier onlyMinter(address _minter) {
        require(_minter == address(0xa8495f277B09516097F395bc0d263c6dB2F5399f), "Not allowed minter");
        _;
    }

    constructor() ERC721("Web3 Online Judge NFT", "WEB3OJNFT") {

    }

    function mint(address to, uint256 tokenId) public onlyMinter(msg.sender) {
        _mint(to, tokenId);
    }
}

// forge create ./src/delegateMintERC721.sol:delegateMintERC721 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
// 0x4ED1300A5259005a29C18639bF234014A525C237
// cast send 0x339F32c774DBA45bad8B17192a54B6e2F008d7de --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "setToken(address _token)" 0x4ED1300A5259005a29C18639bF234014A525C237