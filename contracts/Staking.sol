// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Staking {
    IERC20 public stakingToken;
    IERC20 public rewardToken;

    uint256 public rewardRate = 100; // Har second ka reward
    mapping(address => uint256) public stakedAmount;
    mapping(address => uint256) public lastStakedTime;

    constructor(address _stakingToken, address _rewardToken) {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    function stake(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than 0");
        stakingToken.transferFrom(msg.sender, address(this), _amount);
        stakedAmount[msg.sender] += _amount;
        lastStakedTime[msg.sender] = block.timestamp;
    }

    function calculateReward(address _user) public view returns (uint256) {
        uint256 timeStaked = block.timestamp - lastStakedTime[_user];
        return (stakedAmount[_user] * timeStaked * rewardRate) / 1e18;
    }

    function withdraw() external {
        uint256 reward = calculateReward(msg.sender);
        uint256 amount = stakedAmount[msg.sender];
        
        stakedAmount[msg.sender] = 0;
        stakingToken.transfer(msg.sender, amount);
        rewardToken.transfer(msg.sender, reward); // Reward token bhejte hain
    }
}
