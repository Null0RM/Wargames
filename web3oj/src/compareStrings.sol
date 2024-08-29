// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringCompare {
    function compare(string memory _a, string memory _b) public pure returns (bool) {
        return (keccak256(abi.encodePacked(_a)) == keccak256(abi.encodePacked(_b)));
    }
}

/**
instance: 0x397DE8d9B1198e1513767E2b328b2B03922AF0F9
create: forge create ./src/compareStrings.sol:StringCompare --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
deployed: 0x6D6D31D5041245Be0BE47EE0522B1Bd19752329A
solve: cast send 0x397DE8d9B1198e1513767E2b328b2B03922AF0F9 "setStringCompareContract(address)" 0x6D6D31D5041245Be0BE47EE0522B1Bd19752329A --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
 */