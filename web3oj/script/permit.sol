// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PermitERC20Token} from "../src/permitsERC20Token.sol";

contract scriptPermitERC20Token is Script {
    PermitERC20Token public target;

    function run() public {
        vm.startBroadcast();
        target = new PermitERC20Token();
        target.solve(0x46b9e1ad6fe7b09e37d6c6ba7fbdf1e2f4b700caf1d0fef3a293fb679d6b97ed);
        vm.stopBroadcast();
    }
}