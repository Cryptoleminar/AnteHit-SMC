// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
contract AnteHit {
    address public player1;
    address public player2;
    uint256 public betAmount = 1;

    event GameStarted(); // 錢都進來了。
    event GameFinished(); 
    // 前端 call 
    function joinGame() public payable {
        require(msg.value == betAmount, "Wrong bet amount.");

        // require(player2.length == 0, "Game has already started.");
        player1 = msg.sender;
        player2 = msg.sender;
        emit GameStarted();

    }
}