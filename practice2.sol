// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProfileCreator {
    address public owner;
    string public username;
    uint256 public birthYear;

    // Constructor with arguments
    constructor(string memory _username, uint256 _birthYear) {
        owner = msg.sender;
        username = _username;
        birthYear = _birthYear;
    }

    // View function to get full profile
    function getProfile() public view returns (address, string memory, uint256) {
        return (owner, username, birthYear);
    }
}
