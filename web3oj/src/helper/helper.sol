// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract helper {
    function tmp() public {
        uint256 gasprice = tx.gasprice;
        uint256 gasused = tx.gasused;
    }
}