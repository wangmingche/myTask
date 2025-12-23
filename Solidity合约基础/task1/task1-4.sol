// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInt{
    //罗马字符与对应的数值映射

    mapping(bytes1=>uint256)private romanToIntMap;
    constructor(){
        romanToIntMap["I"] = 1;
        romanToIntMap["V"] = 5;
        romanToIntMap["X"] = 10;
        romanToIntMap["L"] = 50;
        romanToIntMap["C"] = 100;
        romanToIntMap["D"] = 500;
        romanToIntMap["M"] = 1000;
    }

    // 罗马数转为整数
    function romanToInt(string memory roman) public view returns (uint256) {
        // 输入合法性校验
        //require(roman.length > 0, "Invalid input");
        bytes memory romanBytes = bytes(roman);
        uint256 result = 0;
        uint256 prevValue = 0;
        for (uint256 i = romanBytes.length - 1; i < romanBytes.length; i--) {
            uint256 currentValue = romanToIntMap[romanBytes[i]];
            if (currentValue < prevValue) {
                result -= currentValue;
            } else {
                result += currentValue;
            }
            prevValue = currentValue;
        }
        return result;
    }
}