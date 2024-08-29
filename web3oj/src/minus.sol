// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyMinusCalculator {
    function minus(uint256 input1, uint256 input2) override public pure returns (uint256){
        return (input1 - input2);
    }
}

/**
deploy: forge create web3oj/minus.sol:MyMinusCalculator --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY 
CA: 0xbAaEa31F30dbeD5CC812154Ec174D727524BeA34

instance: 0x07F6816376a443d4A1C4b4bb4d4A8EC69B43DEf9
solve: cast send 0x07F6816376a443d4A1C4b4bb4d4A8EC69B43DEf9 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY "setMinusCalculator(address)" "0xbAaEa31F30dbeD5CC812154Ec174D727524BeA34"
 */