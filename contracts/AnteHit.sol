// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
contract AnteHit {
    address public player1;
    address public player2;
    uint256 public betAmount = 1;
    enum PlayerType {
        win,
        lose,
        euqal,
        wait
    }

    event GameStarted(); // 錢都進來了。
    event GameFinished(); 
    // 前端 call 
    function joinGame() public payable {
        require(msg.value == betAmount, "Wrong bet amount.");
        require(player2.length == 0, "Game has already started.");
        if (player1.length == 0) {
            player1 = msg.sender;
        } else {
            player2 = msg.sender;
        }
        emit GameStarted();

    }

    // 後端呼叫來通知遊戲結束
    // 並且發送一個 event 以利後續查詢等等
    function gameFinished(address winer, address loser) admin {
        // TODO: 需要實作寫入 winner loser
        emit GameFinished();
    } 
}