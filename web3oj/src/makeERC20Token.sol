// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract myERC20Token is ERC20, Ownable {
    constructor(string memory name, string memory symbol, uint8 decimals) ERC20(name, symbol) Ownable(msg.sender) {
        _mint(msg.sender, 2_000_000_000 * (10 ** uint256(decimals)));
    }
}

/**
deploy: forge create src/makeERC20Token.sol:myERC20Token --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --constructor-args "Web3 Online Judge Token" "WEB3OJT" 18
CA: 0x3fE705B07828e156D0f7EDfeC23ED24582dbb54e
instance: 0xadcA248D0F5bd09F6391999DE08C6C894fB11bCd
solve: 
> forge script ./script/Counter.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --broadcast
> cast send 0xDf1867A4d659D8D3D98F1d00980C2c6Ff977CD5b "setWeb3ojt(address)" 0x19bbc0e256D5F58FFa4005E5c7CE3238a95DA9AE --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
 */
