// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 反转字符串

contract ReverStringContant{

    function  ReverString(string memory input) public pure returns (string memory) {
        bytes memory inputbytes = bytes(input);

        uint len = inputbytes.length;

        for (uint i = 0; i < len / 2; i++) {
            (inputbytes[i], inputbytes[len - 1 - i]) = (inputbytes[len - 1 - i], inputbytes[i]);
        }

        return string(inputbytes);
    }
}
