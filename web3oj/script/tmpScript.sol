// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {find_rand} from "../src/arraySummation/find_rand.sol";

contract CounterScript is Script {
    event log_addr(address addr);     
    function setUp() public { 
    }

    function run() public {
        vm.startBroadcast();


        // find_rand target = new find_rand();
        // target.phase1();

        address addr = address(0xd06aA464aab1D35123F7a7a5bD8a778da616ee4b);
        address instance = address(0x65426a4D9461504c7bB1a3528f0bc214bAf19FC1);
        find_rand(addr).phase2(instance);
        find_rand(addr).phase3(instance);
        
        vm.stopBroadcast();
    }
}
// cast send --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY 0x69221A885d80bd270FF5487221BEC2D4501202b8 "phase2()" 