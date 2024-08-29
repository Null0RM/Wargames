// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract unlock {
    constructor() {
        (bool suc, ) = address(0x9843A771650a28de6d9ba52C38ca37F8870989c2).call(abi.encodeWithSignature("unlock()"));
        require(suc, "kkkk");
    }
}
