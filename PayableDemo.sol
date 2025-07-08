// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableDemo {
    address public owner;

    constructor() {
        owner = msg.sender; // save who deployed it
    }

    // Function to receive ETH
    function sendEth() public payable {
        require(msg.value > 0, "Send some ETH!");
    }

    // Function to check contract's ETH balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Optional: withdraw by owner
    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}
