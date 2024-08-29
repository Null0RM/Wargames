// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Stake {
    // ETH balance가 0보다 커야 함
    uint256 public totalStaked; // ETH balance보다 커야 함
    mapping(address => uint256) public UserStake; // 0이어야 함
    mapping(address => bool) public Stakers; // 내가 속해있어야 함
    address public WETH;

    constructor(address _weth) payable{
        totalStaked += msg.value;
        WETH = _weth;
    }

    function StakeETH() public payable { // 0.002 eth 를 보내
        require(msg.value > 0.001 ether, "Don't be cheap");
        totalStaked += msg.value;
        UserStake[msg.sender] += msg.value;
        Stakers[msg.sender] = true;
    }

    function StakeWETH(uint256 amount) public returns (bool){
        require(amount >  0.001 ether, "Don't be cheap");
        (,bytes memory allowance) = WETH.call(abi.encodeWithSelector(0xdd62ed3e, msg.sender,address(this))); // allowance는 잔액이 없어도 올릴 수 있음
        require(bytesToUint(allowance) >= amount,"How am I moving the funds honey?");
        totalStaked += amount;
        UserStake[msg.sender] += amount;
        (bool transfered, ) = WETH.call(abi.encodeWithSelector(0x23b872dd, msg.sender,address(this),amount)); // transfered 어디갔놈아..
        Stakers[msg.sender] = true;
        return transfered;
    }

    function Unstake(uint256 amount) public returns (bool){
        require(UserStake[msg.sender] >= amount,"Don't be greedy");
        UserStake[msg.sender] -= amount;
        totalStaked -= amount;
        (bool success, ) = payable(msg.sender).call{value : amount}(""); // 
        return success;
    }

    function bytesToUint(bytes memory data) internal pure returns (uint256) {
        require(data.length >= 32, "Data length must be at least 32 bytes");
        uint256 result;
        assembly {
            result := mload(add(data, 0x20))
        }
        return result;
    }
}

/**

cast send --rpc-url $SEPOLIA_RPC_URL $instance_addr --private-key $UPSIDE_SK "StakeETH()" --value 2000000000000000  

cast send --rpc-url $SEPOLIA_RPC_URL $instance_addr --private-key $PRIVATE_KEY "StakeETH()" --value 2000000000000000  

cast send --rpc-url $SEPOLIA_RPC_URL $WETH_addr --private-key $PRIVATE_KEY "approve(address spender, uint256 value)" $instance_addr 2000000000000000 

cast send --rpc-url $SEPOLIA_RPC_URL $instance_addr --private-key $PRIVATE_KEY "StakeWETH(uint256 amount)" 2000000000000000

cast send --rpc-url $SEPOLIA_RPC_URL $instance_addr --private-key $UPSIDE_SK "Unstake(uint256 amount)" 2000000000000000                                                 


// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import "../src/stake.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CounterScript is Script {
    Stake target = Stake(0x564d925D907d08729cC850B83821c1A2C6e5732C);
    address WETH = target.WETH();

    function run() public {
        uint256 pk = vm.envUint("UPSIDE_SK");
        vm.startBroadcast(pk);

        target.StakeETH{value: 0.002 ether}();

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        target.StakeETH{value: 0.002 ether}();
        IERC20(WETH).approve(address(target), 0.002 ether);
        target.StakeWETH(0.002 ether);

        vm.startBroadcast(vm.envUint("UPSIDE_SK"));

        target.Unstake(0.002 ether);

        vm.stopBroadcast();
    }
}

 */