// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import  {Script} from "forge-std/src/Script.sol";

contract PermitERC20Token is Script, ERC20Permit {
    ERC20Permit public target;
    bytes32 private constant PERMIT_TYPEHASH = keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

    constructor() ERC20("Web3 Online Judge Token", "WEB3OJT") ERC20Permit("Web3 Online Judge Token") {
        target = ERC20Permit(0x8E187521980C11e5017687A939c5E8657ad52ae4);
        _mint(msg.sender, 2000000000 * 10 ** decimals());
    }

    function solve(
        uint256 pk 
    ) public {
        address owner = msg.sender;
        address spender = address(target);
        uint256 value = 20 * 10 ** 18;
        uint256 deadline = block.timestamp + 1 hours;
        uint256 nonce = nonces(owner);

        bytes32 domain_separator = keccak256(
                abi.encode(
                    keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
                    keccak256('Web3 Online Judge Token'),
                    keccak256('1'), 
                    block.chainid, 
                    address(this)
                )
            );

        bytes32 permitHash = keccak256(abi.encodePacked(
                "\x19\x01",
                domain_separator,
                keccak256(abi.encode(
                    PERMIT_TYPEHASH,
                    owner,
                    spender,
                    value,
                    nonce,
                    deadline
                ))
            )
        );
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(pk, permitHash);

        ERC20Permit(this).permit(owner, spender, value, deadline, v, r, s);
    }
}
