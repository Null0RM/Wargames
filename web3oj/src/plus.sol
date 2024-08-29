// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyPlusCalculator {
    function plus(uint256 input1, uint256 input2) public pure returns (uint256){
        return (input1 + input2);
    }
}

/**
deploy: forge create web3oj/plus.sol:MyPlusCalculator --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
CA: 0x83b2f78876604Df7772264C08daA0248601e1849

instance address: 0xDB5FDa1c71c60abB5f480be83b38a23BDb431f76
solve: cast send 0xDB5FDa1c71c60abB5f480be83b38a23BDb431f76 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY "setPlusCalculator(address)" "0x83b2f78876604Df7772264C08daA0248601e1849"
 */