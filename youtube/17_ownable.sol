// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "not owner");
        _;
    }
    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0),"invalid address");
        require(owner != _newOwner,"_newOWner already is owner");
        owner = _newOwner;
    }
    function onlyOwnerCanCallThisFunc() external onlyOwner{
        // code
    }
    function anyOneCanCall() external {
        // code
    }
}