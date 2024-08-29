// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import {Script, console} from "forge-std/Script.sol";
import {exploit} from "../src/UnderTheFlow/src/ex.sol";

contract Attack is Script {
    function setUp() public {

    }

    function run() public {
        vm.startBroadcast();

        exploit Attacker = new exploit();
        Attacker.ex();

        vm.stopBroadcast();
    }
}