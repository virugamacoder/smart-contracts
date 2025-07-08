// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Math.sol";

contract Calculator is Math {
    function sumExample() public pure returns (uint) {
        return add(10, 20); // Inherited from Math
    }
}
