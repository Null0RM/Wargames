// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/AllorNothing/src/AllOrNothing.sol";

contract script is Script {
    ex public target;

    function setUp() public {
        target = new ex(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);
    }

    function run() public {
        target.attack();
    }
}

contract ex {
    AllOrNothing public target;

    constructor (address _target)  {
        target = AllOrNothing(_target);
    }

    function attack() public {

    }
}
