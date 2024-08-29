pragma solidity ^0.7.0;

import {IImprovedERC20} from "./interfaces/IImprovedERC20.sol";

contract ImprovedERC20 is IImprovedERC20 {
    mapping(address => uint256) public override balanceOf;
    mapping(address => mapping(address => uint256)) public override allowance;
    address public override owner;

    string public override name;
    string public override symbol;
    uint8 public override decimals;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        owner = msg.sender;
        balanceOf[msg.sender] = _initialSupply;
    }

    function transfer(
        address _to,
        uint256 _value
    ) external override returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external override returns (bool) {
        require(balanceOf[_from] >= _value, "Insufficient balance"); //from에게 잔액이 충분한지 확인
        require(
            allowance[_from][msg.sender] - _value > 0,
            "Insufficient allowance"
        ); // from이 msg.sender에게 approve한 잔액이 충분한지 확인
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) external override returns (bool) {
        allowance[msg.sender][_spender] = _value;
        return true;
    } // 이것도 나한테 토큰이 있던 없던 맘대로 실행할 수 있음

    function mint(uint256 _value) external override {
        require(msg.sender == owner, "Only owner can mint");
        balanceOf[msg.sender] += _value;
    }

    function burn(address _who, uint256 _value) external override {
        require(balanceOf[_who] >= _value, "Insufficient balance");
        balanceOf[_who] -= _value;
    } //맘대로 실행시킬 수 있네...
}
