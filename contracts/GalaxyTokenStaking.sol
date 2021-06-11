pragma solidity ^0.8.4;

contract GalaxyTokenStaking {
    address private _galaxy;
    uint256 private _rewardPerBlock;

    mapping(address => Staker) public stakers;

    struct Staker {
        uint256 stake;
        mapping(address => StakerRewardInfo) rewardInfo;
    }

    constructor(address galaxy, uint64 rewardPerBlock) {
        _galaxy = galaxy;
        _rewardPerBlock = rewardPerBlcok;
    }

    event Deposit(address indexed staker, uint256 amount);
    event Withdrawn(address indexed withdrawer, uint256 amount);

    function deposit(uint256 amount_) public {
        Staker storage _staker = stakers[msg.sender];
        stakers.stake += _amount;
        totalStakedTokensAmount += _amount;
        _galaxy.safeTransferFrom(msg.sender, address(this), _amount);
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(uint256 amount_) public {
        require(_staker.stake >= _amount, "Not enough amount");
        _staker.stake -= _amount;
        totalStakedTokensAmount -= _amount;
        stakableToken.safeTransfer(msg.sender, _amount);
        emit Withdrawn(msg.sender, _amount);
    }

    function updateReward(address who_) public {
        Staker storage _staker = stakers[msg.sender];
    }

    function estimatedReward(address who_) public view returns (uint256) {
        for (uint256 _i = 0; _i < rewards.length; _i++) {
            Reward storage _reward = rewards[_i];
            if (_rewardToken == _reward.token) return _reward.amount;
        }
        return 0;
    }
}
