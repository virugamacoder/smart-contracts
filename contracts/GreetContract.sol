// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreetContract {
    address public owner;
    string public greeting;

    constructor(string memory _greeting) {
        owner = msg.sender;
        greeting = _greeting;
    }
}
