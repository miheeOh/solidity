// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract IfElse {
    /* 
    visibility 
    : external public private internal
    - 위치(상태변수): 상태변수타입 바로 뒤 
      ex) uint public count;
    - 위치(함수): 함수 인자값 받는 괄호 뒤
      ex) function test(uint _x) external pure returns(uint) {}
      1. external
      : 해당 내용을 외부에 호출 가능 / 내부에서는 호출 불가
      2. public
      : 컨트랙트 내 외부 모두에서 호출 가능
      3. private
      : 컨트랙트의 내부에서만 호출 가능
      4. internal
      : 해당 내용 컨트랙트와 상속받은 컨트랙트 내에서 호출 가능
     */
    uint num1 = 2;
    uint num2 = 4;

    function example(uint _x) external pure returns(uint) {
        // view : (함수 밖의 변수) storage state를 읽기 가능, 변경 불가능
        // pure : (함수 밖의 변수) storage state 읽기 불가능, 변겨 불가능
        // view와 pure는 함수 외부에 존재하는 상태변수의 값은 변경시키기 못한다.
        if(_x <10) {
            return 1;
        } else if(_x <20) {
            return 2;
        }
        return 3;
    }

    function ternary (uint _x) external pure returns (uint) {
        return _x < 10 ? 1 : 2;
    }
    function thisTest(uint _x) external view returns (uint) {
        return this.example(_x);
    }
    function viewTest() external view returns (uint plus, uint multiply) {
        plus = num1 + num2;
        multiply = num1 + num2;
        return (plus, multiply);
    }
    function pureTest() external pure returns (uint plus, uint multiply) {
        //plus = num1 = 10;
        // -> 위의 코드는 에러남 pure는 외부 값 읽지 못함
        uint num1 = 10;
        uint num2 = 15;
        plus = num1 + num2;
        multiply = num1 * num2;
        return (plus, multiply);
    }
}

contract IfElse2 is IfElse {
    function example2(uint _x) external view returns (uint) {
        return this.example(_x);
    }
    // 이렇게 상속받아서 다른 컨트랙트 사용 가능
    // this이용

}