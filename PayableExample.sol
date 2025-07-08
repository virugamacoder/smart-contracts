// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PayableExample {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // Accept Ether
    function deposit() external payable {}

    // Check balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Withdraw Ether (to owner)
    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance); // Send full balance
    }

    // Send Ether to any address using call
    function sendViaCall(address payable _to) public payable {
        require(msg.value > 0, "Send some Ether");
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    // fallback() or receive() to accept Ether directly
    receive() external payable {}
}
