// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract transferERC20Token is ERC20 {
    constructor() ERC20("Web3 Online Judge Token", "WEB3OJT") {
        _mint(msg.sender, 2_000_000_000 * (10 ** 18));
    }
    
    // 잘못 만들은 함수...
    function transferMyERC20Token(address _to, uint256 _value) public {
        require(ERC20(this).balanceOf(address(msg.sender)) > _value, "low balance");
        bool suc = ERC20(this).transfer(_to, _value);
        require(suc, "transfer failed");
    }
}

/**
instance: 0xDf1867A4d659D8D3D98F1d00980C2c6Ff977CD5b
deploy:forge create src/transferERC20Token.sol:transferERC20Token --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY --constructor-args "0x3fE705B07828e156D0f7EDfeC23ED24582dbb54e"
CA:0x666776E7174CAA8D5908A9Ee6554bffF4E1cd1Cf
solve: 
cast send 0x666776E7174CAA8D5908A9Ee6554bffF4E1cd1Cf "transfer(address,uint256)" 0xDf1867A4d659D8D3D98F1d00980C2c6Ff977CD5b 20000000000000000000 --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY 
cast send 0xDf1867A4d659D8D3D98F1d00980C2c6Ff977CD5b "setWeb3ojt(address)" 0x666776E7174CAA8D5908A9Ee6554bffF4E1cd1Cf --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY 
 */