// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // State variable to store the total number of votes
    uint256 public totalVotes;

    // Mapping to store the number of votes per candidate
    mapping(string => uint256) public votesReceived;

    // Event to log when a new vote is cast
    event VoteCast(address indexed voter, string candidate);

    /**
     * @dev Constructor to initialize the contract with zero total votes.
     */
    constructor() {
        totalVotes = 0;
    }

    /**
     * @dev Function to cast a vote for a candidate.
     * @param candidate The name of the candidate.
     */
    function voteForCandidate(string memory candidate) public {
        // Increment the candidate's vote count
        votesReceived[candidate]++;

        // Increment the total vote count
        totalVotes++;

        // Emit a VoteCast event to log the vote
        emit VoteCast(msg.sender, candidate);
    }

    /**
     * @dev Function to get the number of votes received by a candidate.
     * @param candidate The name of the candidate.
     * @return The number of votes received by the candidate.
     */
    function getVotesForCandidate(string memory candidate) public view returns (uint256) {
        return votesReceived[candidate];
    }
}
