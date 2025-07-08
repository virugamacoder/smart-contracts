// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentTracker {
    address public lastSender;
    uint public lastAmount;

    // Anyone can send ETH, we'll record who sent and how much
    function sendEth() public payable {
        require(msg.value > 0, "Send ETH!");
        lastSender = msg.sender;
        lastAmount = msg.value;
    }

    function getLastSender() public view returns(address) {
        return lastSender;
    }

    function getLastAmount() public view returns(uint) {
        return lastAmount;
    }
}
