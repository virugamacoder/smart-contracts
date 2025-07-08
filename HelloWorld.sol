// SPDX-License-Identifier: MIT
// Compiler Version
pragma solidity ^0.8.0;

// Contract Start
contract HelloWorld {
    string public message = "Hello Blockchain!"; // State Variable

    // Function to change the message
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }

    function testMemory() public pure returns (string memory) {
        string memory temp = "Temporary";
        return temp;
    }

    function sayHello(string calldata name)
        external
        pure
        returns (string memory)
    {
        return name;
    }
}
