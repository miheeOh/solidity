// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ForAndWhileLoops {
    function loops() external pure returns (uint) {
        uint z;
        uint w;

        for (uint i=0; i<10; i++) {
            if(i==3) {
                continue;
            }
            z++;
            if(i==5){
                break;
            }
            w++;
        }
        uint j = 0;
        while (j < 10) {
            // code
            j++;
        }
        return w;
    }
    function sub(uint _n) external pure returns (uint) {
        uint s;
        for(uint i=1; i<_n;i++){
            s+=i;
        }
        return s;
    }
}