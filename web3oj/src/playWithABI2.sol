// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyRunWithABI2 {
    bytes32 private privateKey;

    function setPrivateKey(address problemAddress) public {
        privateKey = keccak256(abi.encode(msg.sender, 64, 19, 'thisIsSaltForRandom'));
    }

    // 채점을 위한 함수 입니다.
    function getPrivateKey() public view returns (bytes32) {
        return privateKey;
    }
}
