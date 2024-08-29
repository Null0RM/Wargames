// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface DelegateERC20 {
    function delegateTransfer(address to, uint256 value, address origSender) external returns (bool);
}

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface Forta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

interface CryptoVault { // DET100개, LGT100개
    function setUnderlying(address latestToken) external;
    function sweepToken(IERC20 token) external;
}

interface DoubleEntryPoint { // instanace
    function delegateTransfer(address to, uint256 value, address origSender) external;
}

contract exploit {
    Forta public forta = Forta(0xE93C7e6436C602c71a9af1d8bF1dd4f8C0809Fd4);
    CryptoVault vault = CryptoVault(0x02Acc77dB24FC54709B23dbf561cb28FD4DCE0ef);

    function handleTransaction(address user, bytes calldata msgData) external {
        (address to, uint256 value, address origSender) = abi.decode(msgData[4:], (address, uint256, address));
        if (origSender == address(vault))
            forta.raiseAlert(user);
    }
}
