// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Array {
    uint[] public nums =[1,2,3];
    uint[3] public numsFixed = [4,5,6];

    function examples() external returns(uint[] memory) {
        nums.push(4); // [1,2,3,4]
        uint x = nums[1]; // 2
        nums[2] = 777; // [1,2,777,4]
        delete nums[1];
        nums.pop();
        uint len = nums.length;

        // create array in memory
        uint[] memory a = new uint[](5);
        a[1] = 123; 
        // a.push(123);
        return nums;
    }
    function returnArray() external view returns (uint[3] memory) {
        return numsFixed;
    }
}