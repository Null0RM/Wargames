// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoC {
    constructor() {
        (bool suc, ) = address(0x7A61e56d1D355e9629ED3606bABB53Cc48dcBFD8).call(abi.encodeWithSelector(0xda17c605, address(msg.sender)));
        require(suc, "kkk");
    }
}

// forge create ./src/playWithABI.sol:PoC --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY 

