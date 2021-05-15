/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
    @title GalaxyController
    In Galaxy trading System, we controll three types of prediction pool (1,3,7) prediction
    In each prediction pool, there are 'articles' on both long/short position.
    A user can support any article by voting 'GALA' token.
 */
contract GalaxyController {
    struct User {
        uint256 amount; // How many LP tokens the user has provided.
        bool position; // true: up vote false: down vote
    }

    struct Article {
        address writer;
        uint256 votes;
    }

    struct Pool {
        string assetType; // planning to support $BTC price for now
        uint256 price; // price of asset when pool initialize, accept only decimals
        uint256 totalVotes;
        uint256 endVotingTime; // should limit the voting time, TODO::: policy..
        bool winPosition;
        uint256 allocRate;
    }

    IERC20 galaxy;
    /// Dev address
    address dev;
    /// Staking Address
    address safeBox;
    /// System holds 3(types) * 2(positions) pool info.
    /// Pool type:
    ///     1 => one day after prediction
    ///     3 => three days after prediction
    ///     7 => 7 days after prediction
    /// Positions type:
    ///     0 => long position
    ///     1 => short position
    Pool[][] system;
    /// userInfo holds user voting information of specific pool
    /// calculate pool index by adding {poolIdx} + {positionIdx}
    /// example)
    ///     userInfo[1][msg.sender] => one day prediction pool, long position
    ///     userInfo[2][msg.sender] => one day prediction pool, short position
    ///     userInfo[3][msg.sender] => three day prediction pool, long position
    mapping(uint8 => mapping(address => User)) public userInfo;
    /// articleInfo holds user voting information of specific pool
    /// calculate pool index by adding {poolIdx} + {positionIdx}
    /// example)
    ///     articleInfo[1][msg.sender] => one day prediction pool, long position articles
    ///     articleInfo[2][msg.sender] => one day prediction pool, short position articles
    ///     alticleInfo[3][msg.sender] => three day prediction pool, long position articles
    mapping(uint8 => mapping(address => Article)) public articleInfo;

    constructor(
        IERC20 _galaxy,
        address _dev,
        address _safeBox
    ) {
        galaxy = _galaxy;
        safeBox = _safeBox;
        dev = _dev;
    }

    /** -------- User Function ---------- */

    /// @notice return count of votes of pool
    /// @dev todoo
    /// @param poolType type of pool
    /// @param position true: long, false: short
    function getVotingCount(uint256 poolType, bool position)
        public
        view
        returns (uint256)
    {
        return 1;
    }

    /// @notice user enter specific pool
    function votes(
        uint256 poolType,
        bool position,
        uint256 amount
    ) public {}

    /// @notice user withdraw its profit of pool
    /// @param poolType type of pool
    /// @param position true: long, false: short
    function withdraws(uint8 poolType, bool position) public {}

    /** -------- System Function ---------- */

    /// @notice init pools
    /// @dev
    /// @param
    function initPool(uint8 poolType, uint256 price) public {
        require(msg.sender == dev, "only dev call");
        return;
    }

    /// @notice validate Prediction of article
    /// @dev verify if TP of article hits or not
    /// @param poolType type of pool
    function validatePrediction(uint256 poolType) public returns (bool) {
        return true;
    }

    /// @notice validate prediction of pools and calculate allocation rate
    function updateAllPools() internal {
        return;
    }

    /// @notice calculate the something, updates winning position and allocation rate
    /// TODO:::: we need to set equation with policy !!
    function calculateAllocation() internal {}

    /** -------- Private Function ---------- */
    function _getPoolIdx(uint8 poolType, bool position)
        private
        returns (uint8)
    {
        return position ? poolType + 0 : poolType + 1;
    }
    /**
    

    /// @notice 
    function 
     */
}
