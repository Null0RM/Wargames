// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./AllOrNothing.sol";

contract ex {
    AllOrNothing public target;

    constructor (address _target)  {
        target = AllOrNothing(_target);
    }

    function attack() public {
        
    }
}