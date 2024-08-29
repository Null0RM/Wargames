// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract myERC20Token is ERC20, Ownable {
    constructor(string memory name, string memory symbol, uint8 decimals) ERC20(name, symbol) Ownable(msg.sender) {
        _mint(msg.sender, 2_000_000_000 * (10 ** uint256(decimals)));
    }
}

/**
approve와 allowance의 차이점s
approve: 승인해주는 것
allownance: 승인된 양을 보는 것

<solve>
token contract address: 0x620ee65706D5a46e69099873D21cb14f6c8d20Ce
forge create ./src/allowMyERC20Token.sol:myERC20Token --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --constructor-args "Web3 Online Judge Token" "WEB3OJT" 18 
cast send 0x620ee65706D5a46e69099873D21cb14f6c8d20Ce "approve(address, uint256)" 0x5D39c0B5F888A74b37B2FF73aA7ab94B718555b0 20000000000000000000 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY 
cast send 0x5D39c0B5F888A74b37B2FF73aA7ab94B718555b0 "setWeb3wojt(address)" 0x620ee65706D5a46e69099873D21cb14f6c8d20Ce --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
 */