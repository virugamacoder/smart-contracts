// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract PayAndWithdraw {
    address public owner;

    // Struct to track contributors
    struct Contributor {
        string name;
        uint256 amount;
    }

    mapping(address => Contributor) public contributors;

    event Paid(address indexed sender, uint256 amount, string name);
    event Withdrawn(address indexed to, uint256 amount);
    event Received(address indexed sender, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // Function to contribute Ether with a name
    function contribute(string calldata _name) external payable {
        require(msg.value > 0, "Send ETH to contribute");

        Contributor storage c = contributors[msg.sender];
        c.name = _name;
        c.amount += msg.value;

        emit Paid(msg.sender, msg.value, _name);
    }

    // Check contributor balance
    function getMyContribution() public view returns (uint256) {
        return contributors[msg.sender].amount;
    }

    // Owner can withdraw contract funds
    function withdraw(address payable _to) external {
        require(msg.sender == owner, "Only owner");
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance");

        (bool sent, ) = _to.call{value: balance}("");
        require(sent, "Transfer failed");

        emit Withdrawn(_to, balance);
    }

    // Check contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Pure example (no read/write)
    function mathExample(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // Receive ETH directly
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // Fallback (called when unknown function called or wrong data)
    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }
}
