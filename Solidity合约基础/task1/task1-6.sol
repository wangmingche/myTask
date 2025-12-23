// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 二分叉查找

contract BinarySearch{
    function search(int256[] memory nums, int256 target) public pure returns (int256) {
        
        int256 left = 0;
        int256 right = int256(nums.length - 1);
        while (left <= right) {
            int256 mid = left + (right - left) / 2;
            if (nums[uint256(mid)] == target) {
                return mid;
            } else if (nums[uint256(mid)] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return -1;
    }
}