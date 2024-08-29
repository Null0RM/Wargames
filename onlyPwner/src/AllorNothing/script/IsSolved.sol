pragma solidity 0.8.20;

import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";

contract IsSolved is Script {
    function run() external view {
        address allOrNothing = vm.envAddress("AllOrNothing");

        if (allOrNothing.balance == 0) { // 컨트랙트의 balance를 0으로 만들자
            console.log("is-solved:true");
        } else {
            console.log("is-solved:false");
        }
    }
}
