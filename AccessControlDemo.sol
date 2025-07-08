// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControlDemo {
    address public owner;

    constructor() {
        owner = msg.sender; // whoever deploys is the owner
    }

    // Modifier to protect functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized!");
        _;
    }

    // This function is protected
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // Allow anyone to send ETH
    function sendEth() public payable {}

    // See contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}