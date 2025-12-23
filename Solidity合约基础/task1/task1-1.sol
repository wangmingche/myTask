// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 任务1：Voting合约
// 合约功能：
// *  一个mapping来存储候选人的得票数
// *  一个vote函数，允许用户投票给某个候选人
// *  一个getVotes函数，返回某个候选人的得票数
// *  一个resetVotes函数，重置所有候选人的得票数

contract Voting {
    // 1,候选人映射
    mapping(address => uint256) public votes;
    // 2, 投票记录器
    mapping(address => bool) public voted;
    address[] public validCandidates;
    // 标记地址是否为有效候选人
    //mapping(address => bool) public isCandidate;
    // 管理员地址 （仅管理员可以重置的票）
    address public admin;

    // 构造函数，设置管理员地址
    constructor() {
        admin = msg.sender;
    }
    
    // 权限修饰器：仅管理员可以调用
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }
    // 投票函数
    function vote(address candidate) public {
        // 检查用户是否已投票
        require(!voted[msg.sender], "You have already voted");
        // 检查候选人是否存在
        require(votes[candidate] != 0, "Candidate does not exist");
        // 记录用户已投票
        voted[msg.sender] = true;
        // 增加候选人得票数
        votes[candidate]++;

        validCandidates.push(candidate);
    }
  
    // 获取候选人得票数函数
    function getVotes(address candidate) public view returns (uint256) {
        return votes[candidate];
    }
    
    // 重置所有候选人得票数函数
    function resetVotes() public onlyAdmin{
        uint num =validCandidates.length;
        for (uint i = 0; i < num; i++) {
            votes[validCandidates[i]] = 0;
            voted[validCandidates[i]]=false;
        }
    }

}
