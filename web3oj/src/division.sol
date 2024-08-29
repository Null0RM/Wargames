// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyDivisionCalculator {
    function divide(uint256 input1, uint256 input2) override public pure returns (uint256){
        return (input1 /input2);
    }
}

/**
deploy: forge create web3oj/division.sol:MyDivisionCalculator --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
CA: 0x75C7Ad3E2cC372d87FA8F8FD906f72999be58A8c

instance: 0x3EfFCB66D582a1767383d78578b275d6617BfEF2
solve: cast send 0x3EfFCB66D582a1767383d78578b275d6617BfEF2 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY "setDivisionCalculator(address)" "0x75C7Ad3E2cC372d87FA8F8FD906f72999be58A8c"
 */