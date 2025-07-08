// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiverDemo {
    event Log(string msgType, address sender, uint amount, bytes data);

    // Called when no data is sent
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    // Called when data is sent or wrong function name
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }
}
