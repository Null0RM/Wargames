// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ex} from "../src/Tutorial/src/ex.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        ex target = new ex(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);

        vm.stopBroadcast();
    }
}
