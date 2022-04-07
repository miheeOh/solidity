// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused =_paused;
    }
    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }
    function dec() external {
        require(!paused, "paused");
        count -= 1;
    }
    function inc() external {
        count += 1;
    }

    modifier cap(uint _x) {
        require(_x > 100, "x>=100");
        _;
    }
    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        count += 10;
        _;
        count *= 2;
    }
    /**
    modifier
    : modifier사용시 해당 함수가 실행되기 이전에 modifier 내용이 실행된다.
    modifier내부에 _;가 있는 경우 그 전까지 modifier 내용이 실행되다가 그 이후게 
    기존 함수 내용이 실행되고 해당 함수 내용이 다 실행된 후 modifier의 나머지 코드를 실행함
     */
    function foo() external sandwich {
        count += 1;
    }
    // ex) foo 실행시 count는 22
    // count +10 한 후에 _;에 의해 count +1이 실행되고 그 이후에 count *2가 실행된다.
}