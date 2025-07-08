// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract A {
//     function getVal() public virtual pure returns (string memory) {
//         return "A";
//     }
// }

// contract B is A {
//     function getVal() public virtual override pure returns (string memory) {
//         return string(abi.encodePacked(super.getVal(), " + B"));
//     }
// }

// contract C is B {
//     function getVal() public override pure returns (string memory) {
//         return string(abi.encodePacked(super.getVal(), " + C"));
//     }
// }

contract MathLib {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function message() public pure virtual returns (string memory) {
        return "From MathLib";
    }
}

contract A {
    function greet() public pure virtual returns (string memory) {
        return "Hello from A";
    }

    function common() public pure virtual returns (string memory) {
        return "Common in A";
    }
}

contract B {
    function welcome() public pure returns (string memory) {
        return "Welcome from B";
    }

    function common() public pure virtual returns (string memory) {
        return "Common in B";
    }
}

/*
   Final contract: Inherits A, B, and MathLib
*/
contract AllInOne is A, B, MathLib {
    // Overrides common from both A and B — must resolve conflict
    function common() public pure override(A, B) returns (string memory) {
        return
            string(
                abi.encodePacked(
                    A.common(),
                    " + ",
                    B.common(),
                    " + Overridden in AllInOne"
                )
            );
    }

    // Override greet() from A using `super`
    function greet() public pure override returns (string memory) {
        return
            string(abi.encodePacked(super.greet(), " | Modified in AllInOne"));
    }

    // Call MathLib's add function
    function useAdd() public pure returns (uint256) {
        return add(5, 7);
    }

    // Using super to chain calls (MathLib.message)
    function callMessage() public pure returns (string memory) {
        return
            string(
                abi.encodePacked(super.message(), " + Called from AllInOne")
            );
    }
}
