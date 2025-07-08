// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProfileCreator {
   address public immutable owner;
    string public username;
    uint256 public birthYear;

    // Constructor
    constructor(string memory _username, uint256 _birthYear) {
        owner = msg.sender;
        username = _username;
        birthYear = _birthYear;
    }

    // Custom modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Access-controlled function
    function changeUsername(string memory newUsername) public onlyOwner {
        username = newUsername;
    }

    // View full profile
    function getProfile() public view returns (address, string memory, uint256) {
        return (owner, username, birthYear);
    }
}
