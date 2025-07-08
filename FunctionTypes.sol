// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionTypes {
    uint public num;

    function setNum(uint _n) public {
        num = _n; // default function (changes state)
    }

    function getNum() public view returns(uint) {
        return num; // view function
    }

    function add(uint a, uint b) public pure returns(uint) {
        return a + b; // pure function
    }

    function payNow() public payable {
        require(msg.value > 0, "Send ETH!"); // payable function
    }
}
