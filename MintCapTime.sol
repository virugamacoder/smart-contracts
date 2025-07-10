// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KrunalToken is ERC20, Ownable {
    uint256 public cap;
    uint256 public deploymentTime;
    uint256 public mintTimeLimit; // e.g. 365 days

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialCap_,
        uint256 mintDurationInDays
    ) 
        ERC20(name_, symbol_)
        Ownable(msg.sender)  // ✅ FIX: Pass initial owner
    {
        cap = initialCap_ * 10 ** decimals();
        deploymentTime = block.timestamp;
        mintTimeLimit = mintDurationInDays * 1 days;
    }

    function updateCap(uint256 newCap) public onlyOwner {
        require(newCap > cap, "New cap must be greater");
        cap = newCap;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(block.timestamp <= deploymentTime + mintTimeLimit, "Minting period expired");
        require(totalSupply() + amount <= cap, "Exceeds cap");
        _mint(to, amount);
    }
}
