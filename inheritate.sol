// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract Parent {
//     function greet() public pure returns (string memory) {
//         return "Hello from Parent!";
//     }
// }

// contract Child is Parent {
//     function childGreet() public pure returns (string memory) {
//         return "Hello from Child!";
//     }
// }

// contract A {
//     function getName() public virtual pure returns (string memory) {
//         return "Contract A";
//     }
// }

// contract B is A {
//     function getName() public override pure returns (string memory) {
//         return "Contract B";
//     }
// }


contract A {
    function fnA() public pure returns (string memory) {
        return "from A";
    }
}

contract B {
    function fnB() public pure returns (string memory) {
        return "from B";
    }
}

contract C is A, B {
    // Can use fnA and fnB
}
