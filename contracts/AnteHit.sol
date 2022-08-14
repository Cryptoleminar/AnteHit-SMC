// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
contract AnteHit {
    address public player1;
    address public player2;
    uint256 public betAmount = 1;

    event GameStarted(); // 錢都進來了。
    event GameFinished(); 
}