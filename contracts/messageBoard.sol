// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MessageBoard {
    string public message;
    address public lastUpdatedBy;

    event MessageUpdated(address indexed user, string newMessage);

    function updateMessage(string calldata newMessage) public {
        message = newMessage;
        lastUpdatedBy = msg.sender;
        emit MessageUpdated(msg.sender, newMessage);
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
