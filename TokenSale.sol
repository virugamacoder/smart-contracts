
// pragma solidity ^0.8.20;

// import "./MyToken.sol";

// contract TokenSale {
//     MyToken public token;
//     address public owner;
//     uint256 public rate = 1000; // 1 ETH = 1000 Tokens

//     constructor(address tokenAddress) {
//         token = MyToken(tokenAddress);
//         owner = msg.sender;
//     }

//     receive() external payable {
//         buyTokens();
//     }

//     function buyTokens() public payable {
//         require(msg.value > 0, "Send ETH to buy tokens");

//         uint256 tokenAmount = msg.value * rate;

//         require(token.balanceOf(address(this)) >= tokenAmount, "Not enough tokens in sale");

//         token.transfer(msg.sender, tokenAmount);
//     }

//     function withdraw() public {
//         require(msg.sender == owner, "Only owner can withdraw");
//         payable(owner).transfer(address(this).balance);
//     }

//     function getBalance() public view returns (uint256) {
//         return address(this).balance;
//     }
// }


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSale {
    address public owner;
    IERC20 public token;

    uint256 public price = 0.01 ether;

    constructor(address _token) {
        owner = msg.sender;
        token = IERC20(_token); // Accept already deployed ERC20
    }

    function buyTokens(uint256 amount) public payable {
        require(msg.value == price * amount, "Incorrect ETH amount");
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner");
        payable(owner).transfer(address(this).balance);
    }
}
