// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Base.sol";

contract Derived is Base {
    function whoAmI() public override pure returns (string memory) {
        return "I am Derived";
    }
}
