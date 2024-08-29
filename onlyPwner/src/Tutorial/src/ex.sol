// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./Tutorial.sol";

contract ex {
    constructor(address _target) {
        Tutorial(_target).callMe();
    }
}