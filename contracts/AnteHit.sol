// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/// 目前是先朝著一次性使用合約，走完一次完整的 Happy Path 後再另行優化
contract AnteHit {
    address public player1;
    address public player2;
    uint256 public betAmount = 1;
    bool public gameIsFinished = false;

    enum PlayerType {
        win,
        lose,
        euqal,
        wait
    }

    struct PlayerInfo {
      address player;
      PlayerType playerType;
   }

   PlayerInfo player1v2;
   PlayerInfo player2v2;

    event GameStarted(); // 錢都進來了。
    event GameFinished(); 
    // 前端 call 
    function joinGame() public payable {
        require(msg.value == betAmount, "Wrong bet amount.");
        require(player2.length == 0, "Game has already started.");
        require(gameIsFinished == false, "Game is Finishing.");
        if (player1.length == 0) {
            player1 = msg.sender;
        } else {
            player2 = msg.sender;
        }
        emit GameStarted();

    }

    // 後端呼叫來通知遊戲結束
    // 並且發送一個 event 以利後續查詢等等
    // todo: 需要新增 admin 的 modifier 且 設定為 private
    function gameFinished(address winer, address loser) public {
        // TODO: 需要實作寫入 winner loser
        emit GameFinished();
    } 
}