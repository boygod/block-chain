//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Bank {

    address owner;

    mapping(address => uint) public address2blance;

    constructor() {
        owner = payable(msg.sender);
    }

    function transferIn() payable public {
        address2blance[msg.sender] = address2blance[msg.sender] + msg.value;
        payable(address(this)).transfer(msg.value);
    }

    function withdrawAll() public onlyOwner {
        uint amount = address(this).balance;
        payable(msg.sender).transfer(amount);
    }

    modifier onlyOwner {
        require(msg.sender != owner);
        _;
    }

    fallback() external payable {
    
    }

    receive() external payable {
      
    }

}