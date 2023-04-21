// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game {
    struct Scores {
        uint256 wins;
        uint256 losses;
    }

    address owner;
    
    constructor() {
        owner = msg.sender; // setting the owner the contract deployer. Can be reset to another address
    }

    mapping(bytes32 => mapping(uint256 => Scores)) private scores;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract creator can send requests");
        _;
    }

    function updateScores(bytes32 username, uint256 gameId, uint256 wins, uint256 losses) public onlyOwner {
        scores[username][gameId].wins += wins;
        scores[username][gameId].losses += losses;
    }

    function getScores(bytes32 username, uint256 gameId) public view returns (uint256 wins, uint256 losses) {
        wins = scores[username][gameId].wins;
        losses = scores[username][gameId].losses;
    }
}