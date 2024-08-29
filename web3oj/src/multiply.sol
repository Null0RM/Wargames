// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyMultiplicationCalculator {
    function multiply(uint256 input1, uint256 input2) public pure returns (uint256){
        return (input1 * input2);
    }
}

/**
deploy: forge create web3oj/multiply.sol:MyMultiplicationCalculator --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
CA: 0x783ec87eD6085035F3b4aF52f70aD57B56594583

instance: 0xA6FcEb6b377DdcAE18B9c8538d9557dB2EAEAF71
solve: cast send 0xA6FcEb6b377DdcAE18B9c8538d9557dB2EAEAF71 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY "setMultiplicationCalculator(address)" "0x783ec87eD6085035F3b4aF52f70aD57B56594583"
 */