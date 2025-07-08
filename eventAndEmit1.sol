// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint256 public count;

    // Declare an Event
    event CountChanged(address indexed user, uint256 newCount);

    function increment() public {
        count++;
        // Emit the Event
        emit CountChanged(msg.sender, count);
    }
}
