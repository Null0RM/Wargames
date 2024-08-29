// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract myERC20Token is ERC20, Ownable {
    constructor() ERC20("Web3 Online Judge Token", "WEB3OJT") Ownable(msg.sender) {
        _mint(msg.sender, 2_000_000_000 * (10 ** 18));
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}

/**
create: forge create ./src/delegteMintMyERC20Token.sol:myERC20Token --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY           
contract address: 0x0267fF6883e077D76Bdd10279845012C89A69fb8

cast send 0x19F8431b4546b41aCd4702A9b1b5Ac5cC5Ab5212 "setToken(address)" 0x0267fF6883e077D76Bdd10279845012C89A69fb8 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
 */