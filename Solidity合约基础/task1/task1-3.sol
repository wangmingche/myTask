// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 用 solidity 实现整数转为罗马数
// 题目描述在 https://leetcode.cn/problems/integer-to-roman/description/
contract InternalToRoman{
    struct RomanPair{
        uint256 value;
        string  sysmbol;
    }
    RomanPair[] private romanPairs;
    // 构造函数：初始化 struct 数组
    constructor() {
        // 逐个 push 初始化（顺序：从大到小）
        romanPairs.push(RomanPair({value: 1000, sysmbol: "M"}));
        romanPairs.push(RomanPair({value: 900, sysmbol: "CM"}));
        romanPairs.push(RomanPair({value: 500, sysmbol: "D"}));
        romanPairs.push(RomanPair({value: 400, sysmbol: "CD"}));
        romanPairs.push(RomanPair({value: 100, sysmbol: "C"}));
        romanPairs.push(RomanPair({value: 90, sysmbol: "XC"}));
        romanPairs.push(RomanPair({value: 50, sysmbol: "L"}));
        romanPairs.push(RomanPair({value: 40, sysmbol: "XL"}));
        romanPairs.push(RomanPair({value: 10, sysmbol: "X"}));
        romanPairs.push(RomanPair({value: 9, sysmbol: "IX"}));
        romanPairs.push(RomanPair({value: 5, sysmbol: "V"}));
        romanPairs.push(RomanPair({value: 4, sysmbol: "IV"}));
        romanPairs.push(RomanPair({value: 1, sysmbol: "I"}));
    }

    // 整数转为罗马数
    function intToRoman(uint256 num) public view returns (string memory) {
        // 输入法合法性校验
        require(num > 0 && num < 4000, "Invalid input");
        // 使用bytes来存储结果字符串
        bytes memory result = new bytes(15);

        uint256 index = 0;
        // 遍历罗马数的符号和对应的值
        for (uint256 i = 0; i < romanPairs.length; i++) {
            RomanPair memory currentPair = romanPairs[i];

            // 当整数大于等于当前值时，将对应的符号添加到结果字符串中
            
            while (num >= currentPair.value) {
                bytes memory sysmbolBytes = bytes(currentPair.sysmbol);
                for (uint256 j = 0; j < sysmbolBytes.length; j++) {
                    result[index++] = sysmbolBytes[j];
                    index++;
                }
                num -= currentPair.value;
                if(num==0){
                    break;
                }   
            }
            if (num == 0) {
                break;
            }
        }
        // 4,截取有效长度
        bytes memory validResult = new bytes(index);
        for (uint256 i = 0; i < index; i++) {
            validResult[i] = result[i];
        }

        return string(validResult);
    }

}