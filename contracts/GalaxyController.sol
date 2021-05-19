/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
    @title GalaxyController
    In Galaxy trading System, we controll three types of prediction pool (1,3,7) prediction
    In each prediction pool, there are 'articles' on both long/short position.
    A user can support any article by voting 'GALA' token.
 */
contract GalaxyController is Ownalbe {
    struct Article {
        address writer;
        uint256 votes;
        uint256 targetPrice;
    }

    struct Pool {
        string assetType; // planning to support $BTC price for now
        uint256 initPrice; // price of asset when pool initialize, accept only decimals
        uint256 finalizePrice; //price after settlement;
        boolean isVotable; // votable or not
    }

    IERC20 galaxy;
    /// admin address
    address amdin;
    /// Staking Address
    address sharePool;

    constructor(
        IERC20 _galaxy,
        address _admin,
        address _sharePool
    ) {
        galaxy = _galaxy;
        sharePool = _sharePool;
        admin = _admin;
    }

    //system
    Pool[] system;
    mapping(uint256 => mapping(uint256 => Article)) public articles; // poolId => articleId => Article
    uint256[] articlesInfo; // array of articles
    mapping(uint256 => mapping(address => uint256)) public userPosition; // articleId => user Address => # of votes
    mapping(address => uint256) public rewardDebt; //unlocked rewardDebt

    /** ------------ Logging -------------- */
    event InitPool(uint256 poolIndex_, string assetType_, uint256 price_);
    event SettlePool(uint256 longIdx_, uint256 shortIdx_, uint256 price_);
    event Votes(uint256 poolIdx_, uint256 articleIdx_, uint256 amount_);
    event TakeProfit();
    event RegisterArticle(
        uint256 poolIdx,
        uint256 articleIdx,
        uint256 targetPrice_
    );

    /** -------- System Function: onlyOwner ---------- */

    /// @notice init pools
    function initPool(
        uint256 poolIndex_,
        string assetType_,
        uint256 price_
    ) public onlyOwner {
        system[poolIndex_].assetType = assetType_;
        system[poolIndex_].price = price_;
        system[poolIndex_].votable = true;

        emit InitPool(poolIndex_, assetType_, price_);
    }

    /// @notice settle the pool
    function settle(
        uint256 longIdx_,
        uint256 shortIdx_,
        uint256 finalizePrice_
    ) public onlyOwner {
        _settle(longPoolIdx_, finalizePrice_);
        _settle(shortPoolIdx_, finalizePrice_);

        emit SettlePool(lon);
    }

    //@TODO
    function _settle(uint256 poolIdx, uint256 finalizePrice_) private {
        return;
    }

    /** -------- User Function ---------- */

    /// @notice voting the pool
    function vote(
        uint256 poolIdx_,
        uint256 articleIdx_,
        uint256 amount_
    ) public {
        articles[poolIdx_][articleIdx_].votes =
            articles[poolIdx_][articleIdx_].votes +
            amount_;

        userPosition[msg.sender] = userPosition[msg.sender] + amount_;

        galaxy.approve(address(this), type(uint256).max);
        galaxy.transferFrom(msg.sender, address(this), _amount);
    }

    function getVoteCountOf(uint256 poolIdx_, uint256 artlceIdx_)
        external
        view
        returns (uint256)
    {
        return articles[poolIdx_][articleIdx_].votes;
    }

    function getTotalVoteCountOf(uint256 poolIdx)
        external
        view
        returns (uint256)
    {
        uint256 ret = 0;
        uint256 length = articlesInfo.length;
        for (uint256 idx = 0; idx < length; ++idx) {
            ret = ret + articles[poolIdx][articleInfo[idx]];
        }
    }

    function takeRewardDebt() public {
        debt = rewardDebt[msg.sender];
        galaxy.transferFrom(address(this), msg.sender, debt);
        emit TakeProfit();
    }

    /** -------- Writer Function ---------- */
    function registerArticle(
        uint256 poolIdx_,
        uint256 articleIdx,
        uint256 targetPrice_
    ) public {
        if (poolIdx / 2 == 0) {
            require(
                system[poolIdx].price < targetPrice_,
                "Long prediction should higher than pool base price"
            );
        } else {
            require(
                system[poolIdx].price > targetPrice_,
                "Long prediction should lower than pool base price"
            );
        }

        articles[poolIdx_][articleIdx].writer = msg.sender;
        articles[poolIdx_][articleIdx].targetPrice = targetPrice_;

        emit RegisterArticle(poolIdx, articleIdx, targetPrice_);
    }
}
