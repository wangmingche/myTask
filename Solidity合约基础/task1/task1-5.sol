// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 合并两个有序数组
contract MergeSortedArrays{
    
    function merge(int256[] memory nums1, int256[] memory nums2) public pure returns (int256[] memory) {
        uint256 num1=nums1.length;
        uint256 num2=nums2.length;
        int256[] memory merged = new int256[](num1+num2);
        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;
        while (i < num1 && j < num2) {
            if (nums1[i] < nums2[j]) {
                merged[k] = nums1[i];
                i++;
            } else {
                merged[k] = nums2[j];
                j++;
            }
            k++;
        }
        while (i < nums1.length) {
            merged[k] = nums1[i];
            i++;
            k++;
        }
        while (j < nums2.length) {
            merged[k] = nums2[j];
            j++;
            k++;
        }
        return merged;
    }
}