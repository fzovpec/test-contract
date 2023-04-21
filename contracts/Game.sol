// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game {
    struct Scores {
        uint256 wins;
        uint256 losses;
    }

    mapping(bytes32 => mapping(uint256 => Scores)) private scores;

    function updateScores(bytes32 username, uint256 gameId, uint256 wins, uint256 losses) public {
        scores[username][gameId].wins += wins;
        scores[username][gameId].losses += losses;
    }

    function getScores(bytes32 username, uint256 gameId) public view returns (uint256 wins, uint256 losses) {
        wins = scores[username][gameId].wins;
        losses = scores[username][gameId].losses;
    }
}