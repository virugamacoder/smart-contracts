// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./KrunalTokenV1.sol";

contract KrunalTokenV2 is KrunalTokenV1 {
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
