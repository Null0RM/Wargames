pragma solidity 0.8.20;

import {IAllOrNothing} from "./interfaces/IAllOrNothing.sol";
import {Multicall} from "./Multicall.sol";

/// A contract where users can bet on a random number being published.
/// The user who is closest to the number wins all the bets.

// 나는 1ether가 있네요
contract AllOrNothing is IAllOrNothing, Multicall { // 5ether 가지고있음
    address public owner; // 0xA9c1176825bBd9B9f8636e1aBa915f413059fBa0
    address public bestPlayer; // 0
    uint256 public winningNumber; // 0 
    mapping(address => uint256) public bets; // 0

    uint256 public immutable BET_AMOUNT; 
    uint256 public immutable DEADLINE;
    uint256 public immutable DECLARE_DEADLINE;

    constructor(uint256 betAmount, uint256 duration) {
        owner = msg.sender;
        BET_AMOUNT = betAmount; // 1 ether
        DEADLINE = block.timestamp + duration; // 1722068170 (생성된 시간  + 10분)
        DECLARE_DEADLINE = DEADLINE + 1 days; // 1722154570 (1 days = 86400)
    }

    function declareWinner(address user) external {
        require(bets[user] != 0, "Must have placed bet"); // bet을 먼저 해야함
        require(
            block.timestamp >= DEADLINE && block.timestamp < DECLARE_DEADLINE,
            "Deadline not passed"
        ); // 이 둘 사이에 해야함
        require(winningNumber != 0, "Winning number not published"); // winning number가 0 이 아니어야 함

        if (bestPlayer == address(0)) { // 이걸 실행시켜야하나
            bestPlayer = user;
            return;
        }

        unchecked { // overflow 가능?
            uint256 distance = bets[user] > winningNumber
                ? bets[user] - winningNumber
                : winningNumber - bets[user]; // underflow?

            uint256 bestDistance = bets[bestPlayer] > winningNumber
                ? bets[bestPlayer] - winningNumber
                : winningNumber - bets[bestPlayer];

            if (distance < bestDistance) {
                bestPlayer = user;
            } // 아니면 이거?
        }
    }
    
    /**
    내가 bestPlayer & declare_deadline보다 커야함
    전액을 송금
     */
    function withdrawWinnings() external {
        require(msg.sender == bestPlayer, "Must be best player"); // best player가 되어야 함
        require(block.timestamp >= DECLARE_DEADLINE, "Deadline not passed"); // 마지막 하루가 지나야 함

        payable(msg.sender).transfer(address(this).balance); // 전액 송금
    }

    /**
    bets[recipient]가 0이어야하고, 1 ether를 보내야함 (deadline 전에)
    배열에 number를 넣음
     */
    function bet(uint256 number, address recipient) external payable { // bet을 합니다 .
        require(bets[recipient] == 0, "Already placed bet"); // bet을 한 적이 없어야 함 
        require(msg.value == BET_AMOUNT, "Value too low"); // 1 ether를 보내야함
        require(block.timestamp < DEADLINE, "Deadline passed"); // deadline 전에 보내야 함

        bets[recipient] = number; // number에 bet을 함.
        // recipient는 뭐고, number는 뭐지?
    }

    /**
    모든 bet을 출금하는 함수
     */
    function void() external {
        require(bets[msg.sender] != 0, "Must have placed bet"); // bet을 한 적이 있어야 함
        require(block.timestamp < DEADLINE, "Deadline passed"); // deadline이 지나기 전임

        bets[msg.sender] = 0;
        payable(msg.sender).transfer(BET_AMOUNT);
    }

    /** 
    msg.sender의 bet금액 존재 && _to의 bets가 0이어야 함
    to에게 msgsender의 bet을 전달 // msgsender는 0
     */
    function transfer(address to) external {
        require(bets[msg.sender] != 0, "Must have placed bet"); // 
        require(bets[to] == 0, "Recipient must not have placed bet"); //

        bets[to] = bets[msg.sender];
        bets[msg.sender] = 0;
    }

    function publish(uint256 number) external { // winning number 를 만드는 애 // multicall로 owner를 조작할 수 있나?
        require(msg.sender == owner, "Must be owner");
        require(block.timestamp >= DEADLINE, "Deadline not passed");
        winningNumber = number;
    }
}

/**
Delegatecall을 address(this)에게 하면?
tx.origin: 나
msg.sender: 나
 */