// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorDemo {
    address public immutable owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must send ETH");
        balance += msg.value;
    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not owner");
        if (_amount > balance) {
            revert("Insufficient balance");
        }
        balance -= _amount;
    }

    function testAssert() public view {
        assert(balance >= 0);
    }
}
