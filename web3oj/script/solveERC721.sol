// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/script.sol";
import {myERC721contract} from "../src/makeERC721.sol";

contract PoC is Script {
    myERC721contract public target;

    function run() public {
        vm.startBroadcast(msg.sender);

        target = new myERC721contract();
        uint256 tokenId = target.mintNFT(msg.sender);
        require(keccak256(abi.encode(target.tokenURI(tokenId))) == keccak256(abi.encode("https://app.web3oj.com/web3ojnft/0"))); 
        // address(0xE99A2bBC43B19Bd0e00D14cbCDD1473AEEfe96E8).call(abi.encodeWithSignature("setWeb3ojNFT(address _web3ojNFT)", address(target)));
        vm.stopBroadcast();
    }
}
