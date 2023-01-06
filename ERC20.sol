// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CryptoNinjaPoints is ERC20,Ownable{
    constructor() ERC20("CryptoNinjaPoints", "CNP"){
        _mint(msg.sender,9*10**18);
    }

 function mint(address to,uint amount)onlyOwner public{
     require(amount >= 0,"put some amount");
     require(to != address(0),"address is zero");
     _mint(to,amount);
    }

}
