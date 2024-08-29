// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
ETH 송금하고 받기
문제 컨트랙트 인스턴스 주소 : 0x2bb4D47CCf09d7f9a02697F28a4De33Ee02bE174
ETH를 일반 지갑 (EOA, External Owned Account) 에 송금할 수도 있고, 스마트 컨트랙트(CA, ContractAddress)에도 송금할수 있다.

먼저 일반지갑으로 문제 컨트랙트에게 이더를 송금하고, 송금한 이더를 다시 돌려받을 컨트랙트를 작성하고 setReceiveEtherAddress함수를 이용하여 문제 컨트랙트에 설정한뒤 제출하시오.

일반지갑(EOA) → 문제 컨트랙트(CA) → 이더를 돌려받을 컨트랙트(CA)
문제를 제출하면 문제 컨트랙트가 설정한 컨트랙트 주소로 이더를 송금합니다.
 */

 contract PoC {
    receive() external payable {}
 }

// forge create --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY ./src/playWithETH.sol:PoC
// cast send 0x2bb4D47CCf09d7f9a02697F28a4De33Ee02bE174 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --value 1
// cast send 0x2bb4D47CCf09d7f9a02697F28a4De33Ee02bE174 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "setReceiveEtherAddress(address)" 0x4C5B19Fb043d22c00DCE329B9EBa1d782c549b14
