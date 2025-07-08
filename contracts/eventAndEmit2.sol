// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;

    event CountChanged(address indexed user, uint256 newCount);

    function increment() public {
        count += 1;
        emit CountChanged(msg.sender, count);
    }

    function decrement() public {
        require(count > 0, "Count is already 0");
        count -= 1;
        emit CountChanged(msg.sender, count);
    }
}
