// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CommunityWallet {
    // 🔐 Owner Setup
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // 🧠 Modifier to restrict to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // 📋 Donor Data Structure
    struct Donor {
        uint totalDonated;
        uint lastDonation;
        uint donationsCount;
    }

    // 📦 Donor Records
    mapping(address => Donor) public donors;
    address[] public donorList;

    // 📢 Events
    event Donated(address indexed from, uint amount);
    event Withdrawn(address to, uint amount);
    event FallbackCalled(address caller, uint value);

    // 💰 Donate Ether
    function donate() external payable {
        require(msg.value > 0, "Must send some ETH");

        Donor storage user = donors[msg.sender];

        if (user.donationsCount == 0) {
            donorList.push(msg.sender); // New donor
        }

        user.totalDonated += msg.value;
        user.lastDonation = msg.value;
        user.donationsCount += 1;

        emit Donated(msg.sender, msg.value);
    }

    // 🔐 Owner Withdraw to any address
    function withdraw(address payable _to, uint _amount) external onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance");

        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "ETH transfer failed");

        emit Withdrawn(_to, _amount);
    }

    // 🔎 Get Contract Balance
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // 🧾 Get total donors count
    function getDonorCount() external view returns (uint) {
        return donorList.length;
    }

    // 🔍 Get pure example (utility logic only)
    function double(uint x) external pure returns (uint) {
        return x * 2;
    }

    // ✅ Fallback for unknown function calls with value send
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value);
    }

    // ✅ Receive Ether directly wuthout value send
    receive() external payable {
        emit Donated(msg.sender, msg.value); // Optional
    }

    // 🚨 Manual assert test (for demonstration)
    function assertExample(uint _x) external pure returns (string memory) {
        assert(_x < 1000); // will revert if false
        return "Safe input";
    }
}
