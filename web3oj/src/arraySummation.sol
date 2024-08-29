// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SumOfArray {
    function sum(uint256[] memory _a) external pure returns (uint256 ret) {
        assembly {
            ret := add(ret, mload(add(_a, 0x20)))
            ret := add(ret, mload(add(_a, 0x40)))
            ret := add(ret, mload(add(_a, 0x60)))
            ret := add(ret, mload(add(_a, 0x80)))
            ret := add(ret, mload(add(_a, 0xa0)))
            ret := add(ret, mload(add(_a, 0xc0)))
            ret := add(ret, mload(add(_a, 0xe0)))
            ret := add(ret, mload(add(_a, 0x100)))
            ret := add(ret, mload(add(_a, 0x120)))
            ret := add(ret, mload(add(_a, 0x140)))
            ret := add(ret, mload(add(_a, 0x160)))
            ret := add(ret, mload(add(_a, 0x180)))
            ret := add(ret, mload(add(_a, 0x1a0)))
            ret := add(ret, mload(add(_a, 0x1c0)))
            ret := add(ret, mload(add(_a, 0x1e0)))
            ret := add(ret, mload(add(_a, 0x200)))
            ret := add(ret, mload(add(_a, 0x220)))
            ret := add(ret, mload(add(_a, 0x240)))
            ret := add(ret, mload(add(_a, 0x260)))
            ret := add(ret, mload(add(_a, 0x280)))
            ret := add(ret, mload(add(_a, 0x2a0)))
            ret := add(ret, mload(add(_a, 0x2c0)))
            ret := add(ret, mload(add(_a, 0x2e0)))
            ret := add(ret, mload(add(_a, 0x300)))
            ret := add(ret, mload(add(_a, 0x320)))
            ret := add(ret, mload(add(_a, 0x340)))
            ret := add(ret, mload(add(_a, 0x360)))
            ret := add(ret, mload(add(_a, 0x380)))
            ret := add(ret, mload(add(_a, 0x3a0)))
            ret := add(ret, mload(add(_a, 0x3c0)))
            ret := add(ret, mload(add(_a, 0x3e0)))
            ret := add(ret, mload(add(_a, 0x400)))
            ret := add(ret, mload(add(_a, 0x420)))
            ret := add(ret, mload(add(_a, 0x440)))
            ret := add(ret, mload(add(_a, 0x460)))
            ret := add(ret, mload(add(_a, 0x480)))
            ret := add(ret, mload(add(_a, 0x4a0)))
            ret := add(ret, mload(add(_a, 0x4c0)))
            ret := add(ret, mload(add(_a, 0x4e0)))
            ret := add(ret, mload(add(_a, 0x500)))
            ret := add(ret, mload(add(_a, 0x520)))
            ret := add(ret, mload(add(_a, 0x540)))
            ret := add(ret, mload(add(_a, 0x560)))
            ret := add(ret, mload(add(_a, 0x580)))
            ret := add(ret, mload(add(_a, 0x5a0)))
            ret := add(ret, mload(add(_a, 0x5c0)))
            ret := add(ret, mload(add(_a, 0x5e0)))
            ret := add(ret, mload(add(_a, 0x600)))
            ret := add(ret, mload(add(_a, 0x620)))
            ret := add(ret, mload(add(_a, 0x640)))
            ret := add(ret, mload(add(_a, 0x660)))
            ret := add(ret, mload(add(_a, 0x680)))
            ret := add(ret, mload(add(_a, 0x6a0)))
            ret := add(ret, mload(add(_a, 0x6c0)))
            ret := add(ret, mload(add(_a, 0x6e0)))
            ret := add(ret, mload(add(_a, 0x700)))
            ret := add(ret, mload(add(_a, 0x720)))
            ret := add(ret, mload(add(_a, 0x740)))
            ret := add(ret, mload(add(_a, 0x760)))
            ret := add(ret, mload(add(_a, 0x780)))
            ret := add(ret, mload(add(_a, 0x7a0)))
            ret := add(ret, mload(add(_a, 0x7c0)))
            ret := add(ret, mload(add(_a, 0x7e0)))
            ret := add(ret, mload(add(_a, 0x800)))
            ret := add(ret, mload(add(_a, 0x820)))
            ret := add(ret, mload(add(_a, 0x840)))
            ret := add(ret, mload(add(_a, 0x860)))
            ret := add(ret, mload(add(_a, 0x880)))
            ret := add(ret, mload(add(_a, 0x8a0)))
            ret := add(ret, mload(add(_a, 0x8c0)))
            ret := add(ret, mload(add(_a, 0x8e0)))
            ret := add(ret, mload(add(_a, 0x900)))
            ret := add(ret, mload(add(_a, 0x920)))
            ret := add(ret, mload(add(_a, 0x940)))
            ret := add(ret, mload(add(_a, 0x960)))
            ret := add(ret, mload(add(_a, 0x980)))
            ret := add(ret, mload(add(_a, 0x9a0)))
            ret := add(ret, mload(add(_a, 0x9c0)))
            ret := add(ret, mload(add(_a, 0x9e0)))
            ret := add(ret, mload(add(_a, 0xa00)))
            ret := add(ret, mload(add(_a, 0xa20)))
            ret := add(ret, mload(add(_a, 0xa40)))
            ret := add(ret, mload(add(_a, 0xa60)))
            ret := add(ret, mload(add(_a, 0xa80)))
            ret := add(ret, mload(add(_a, 0xaa0)))
            ret := add(ret, mload(add(_a, 0xac0)))
            ret := add(ret, mload(add(_a, 0xae0)))
            ret := add(ret, mload(add(_a, 0xb00)))
            ret := add(ret, mload(add(_a, 0xb20)))
            ret := add(ret, mload(add(_a, 0xb40)))
            ret := add(ret, mload(add(_a, 0xb60)))
            ret := add(ret, mload(add(_a, 0xb80)))
            ret := add(ret, mload(add(_a, 0xba0)))
            ret := add(ret, mload(add(_a, 0xbc0)))
            ret := add(ret, mload(add(_a, 0xbe0)))
            ret := add(ret, mload(add(_a, 0xc00)))
            ret := add(ret, mload(add(_a, 0xc20)))
            ret := add(ret, mload(add(_a, 0xc40)))
            ret := add(ret, mload(add(_a, 0xc60)))
            ret := add(ret, mload(add(_a, 0xc80)))
        }
    }
}
/**
// initialize code
PUSH1 0x80
PUSH0
MSTORE

PUSH2	0x1fe // code size
DUP1	
PUSH1 0x0e // code offset
PUSH0
CODECOPY	
PUSH0
RETURN	

PUSH1 0x44
CALLDATALOAD
PUSH1 0x64
CALLDATALOAD
ADD

PUSH1 0x84
CALLDATALOAD
ADD

PUSH1 0xA4
CALLDATALOAD
ADD

PUSH1 0xC4
CALLDATALOAD
ADD

PUSH1 0xE4
CALLDATALOAD
ADD

PUSH2 0x104
CALLDATALOAD
ADD

PUSH2 0x124
CALLDATALOAD
ADD

PUSH2 0x144
CALLDATALOAD
ADD

PUSH2 0x164
CALLDATALOAD
ADD

PUSH2 0x184
CALLDATALOAD
ADD

PUSH2 0x1A4
CALLDATALOAD
ADD

PUSH2 0x1C4
CALLDATALOAD
ADD

PUSH2 0x1E4
CALLDATALOAD
ADD

PUSH2 0x204
CALLDATALOAD
ADD

PUSH2 0x224
CALLDATALOAD
ADD

PUSH2 0x244
CALLDATALOAD
ADD

PUSH2 0x264
CALLDATALOAD
ADD

PUSH2 0x284
CALLDATALOAD
ADD

PUSH2 0x2A4
CALLDATALOAD
ADD

PUSH2 0x2C4
CALLDATALOAD
ADD

PUSH2 0x2E4
CALLDATALOAD
ADD

PUSH2 0x304
CALLDATALOAD
ADD

PUSH2 0x324
CALLDATALOAD
ADD

PUSH2 0x344
CALLDATALOAD
ADD

PUSH2 0x364
CALLDATALOAD
ADD

PUSH2 0x384
CALLDATALOAD
ADD

PUSH2 0x3A4
CALLDATALOAD
ADD

PUSH2 0x3C4
CALLDATALOAD
ADD

PUSH2 0x3E4
CALLDATALOAD
ADD

PUSH2 0x404
CALLDATALOAD
ADD

PUSH2 0x424
CALLDATALOAD
ADD

PUSH2 0x444
CALLDATALOAD
ADD

PUSH2 0x464
CALLDATALOAD
ADD

PUSH2 0x484
CALLDATALOAD
ADD

PUSH2 0x4A4
CALLDATALOAD
ADD

PUSH2 0x4C4
CALLDATALOAD
ADD

PUSH2 0x4E4
CALLDATALOAD
ADD

PUSH2 0x504
CALLDATALOAD
ADD

PUSH2 0x524
CALLDATALOAD
ADD

PUSH2 0x544
CALLDATALOAD
ADD

PUSH2 0x564
CALLDATALOAD
ADD

PUSH2 0x584
CALLDATALOAD
ADD

PUSH2 0x5A4
CALLDATALOAD
ADD

PUSH2 0x5C4
CALLDATALOAD
ADD

PUSH2 0x5E4
CALLDATALOAD
ADD

PUSH2 0x604
CALLDATALOAD
ADD

PUSH2 0x624
CALLDATALOAD
ADD

PUSH2 0x644
CALLDATALOAD
ADD

PUSH2 0x664
CALLDATALOAD
ADD

PUSH2 0x684
CALLDATALOAD
ADD

PUSH2 0x6A4
CALLDATALOAD
ADD

PUSH2 0x6C4
CALLDATALOAD
ADD

PUSH2 0x6E4
CALLDATALOAD
ADD

PUSH2 0x704
CALLDATALOAD
ADD

PUSH2 0x724
CALLDATALOAD
ADD

PUSH2 0x744
CALLDATALOAD
ADD

PUSH2 0x764
CALLDATALOAD
ADD

PUSH2 0x784
CALLDATALOAD
ADD

PUSH2 0x7A4
CALLDATALOAD
ADD

PUSH2 0x7C4
CALLDATALOAD
ADD

PUSH2 0x7E4
CALLDATALOAD
ADD

PUSH2 0x804
CALLDATALOAD
ADD

PUSH2 0x824
CALLDATALOAD
ADD

PUSH2 0x844
CALLDATALOAD
ADD

PUSH2 0x864
CALLDATALOAD
ADD

PUSH2 0x884
CALLDATALOAD
ADD

PUSH2 0x8A4
CALLDATALOAD
ADD

PUSH2 0x8C4
CALLDATALOAD
ADD

PUSH2 0x8E4
CALLDATALOAD
ADD

PUSH2 0x904
CALLDATALOAD
ADD

PUSH2 0x924
CALLDATALOAD
ADD

PUSH2 0x944
CALLDATALOAD
ADD

PUSH2 0x964
CALLDATALOAD
ADD

PUSH2 0x984
CALLDATALOAD
ADD

PUSH2 0x9A4
CALLDATALOAD
ADD

PUSH2 0x9C4
CALLDATALOAD
ADD

PUSH2 0x9E4
CALLDATALOAD
ADD

PUSH2 0xA04
CALLDATALOAD
ADD

PUSH2 0xA24
CALLDATALOAD
ADD

PUSH2 0xA44
CALLDATALOAD
ADD

PUSH2 0xA64
CALLDATALOAD
ADD

PUSH2 0xA84
CALLDATALOAD
ADD

PUSH2 0xAA4
CALLDATALOAD
ADD

PUSH2 0xAC4
CALLDATALOAD
ADD

PUSH2 0xAE4
CALLDATALOAD
ADD

PUSH2 0xB04
CALLDATALOAD
ADD

PUSH2 0xB24
CALLDATALOAD
ADD

PUSH2 0xB44
CALLDATALOAD
ADD

PUSH2 0xB64
CALLDATALOAD
ADD

PUSH2 0xB84
CALLDATALOAD
ADD

PUSH2 0xBA4
CALLDATALOAD
ADD

PUSH2 0xBC4
CALLDATALOAD
ADD

PUSH2 0xBE4
CALLDATALOAD
ADD

PUSH2 0xC04
CALLDATALOAD
ADD

PUSH2 0xC24
CALLDATALOAD
ADD

PUSH2 0xC44
CALLDATALOAD
ADD

PUSH2 0xC64
CALLDATALOAD
ADD

PUSH2 0xC84
CALLDATALOAD
ADD

PUSH2 0xCa4
CALLDATALOAD
ADD

PUSH3 0x123456
PUSH0

MSTORE
MSIZE
PUSH0
RETURN

2바이트로 해버리는건?

*/

/**
PUSH1 0x80
PUSH0
MSTORE

PUSH2	0x1fe // code size
DUP1	
PUSH1 0x0e // code offset
PUSH0
CODECOPY	
PUSH0
RETURN	

// runtime code

push1 0xc80
push0
push0
calldatacopy


gas fee 줄이기
-> zero byte많이 사용
-> opcode사용 gas 값 줄이기

 */
