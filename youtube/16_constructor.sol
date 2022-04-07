// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Constructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
    // constructor함수는 해당 컨트랙트 생성시에만 한 번 실행된다.
}