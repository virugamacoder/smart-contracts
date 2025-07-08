// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearnCalldataMemoryStorage{
    string public savedMessage;  

    function saveMsg(string calldata userInput) external {
        string memory temp = userInput;
        savedMessage = temp;
    }

    function viewMsg() external view returns (string memory){
        return savedMessage;
    }
}