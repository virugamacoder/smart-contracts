// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function whoAmI() public virtual pure returns (string memory) {
        return "I am Base";
    }
}
