// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract KrunalTokenV1 is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    uint256 private _cap;

    function initialize(string memory name, string memory symbol, uint256 cap_) public initializer {
        __ERC20_init(name, symbol);
        __Ownable_init(msg.sender);
        require(cap_ > 0, "Cap must be > 0");
        _cap = cap_;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= _cap, "Cap exceeded");
        _mint(to, amount);
    }

    function cap() public view returns (uint256) {
        return _cap;
    }

    function updateCap(uint256 newCap) public onlyOwner {
        require(newCap >= totalSupply(), "New cap < supply");
        _cap = newCap;
    }
}
