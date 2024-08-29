// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import "../src/motorbike.sol";

contract CounterScript is Script {

    function run() public {
        vm.startBroadcast(0xE9c6Bb1b3dA49415A788D005b9a4fef9f5f19eA3);

        exploit target = new exploit();
        target.attack();
        
        vm.stopBroadcast();
    }
}
