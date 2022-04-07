// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// require revert assert
// custom error - save gas;

/*
1. require
: 조건 미충족시 에러, gas 환불
2. revert
: 무조건적 에러 발생, gas 환불
3. assert
: 조건 미충족시 에러, gas 환불x
*/

contract Error {
    function testRequire(uint _i) public pure {
        require(_i < 10, "i > 10");
        //
    }

    function testRevert(uint _i) public pure {
        // if( _i < 10) {
        //     revert("i> 10");
        // }
        if(_i > 1) {
            // code
            if( _i > 10) {
                revert ("_i > 10 ");
            }
        }
    }

    uint public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }
    function foo(uint _i) public {
        num += 1;
        require(_i<10);
    }
    error MyError(address caller, uint i);

    function testCustomError(uint _i) public view {
        // require(_i < 10 ,"very long error messag");
        // ...code
        if( _i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}