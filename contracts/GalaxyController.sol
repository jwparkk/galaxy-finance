/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;

/**
@title GalaxyController
In Galaxy trading System, we controll three types of prediction pool (1,3,7) prediction
In each prediction pool, there are 'articles' on both long/short position.
A user can support any article by voting 'GALA' token.
 */
contract GalaxyController {
    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        bool position; // true: up vote false: down vote
    }

    struct Article {
        address writer;
        uint256 votes;
    }

    struct Pool {
        uint256 totalVotes;
        uint256 endTime;
    }

    //Dev address
    address dev;

    constructor(address _dev) {
        dev = _dev;
    }

    // ...TODO...
    function getVotingCount(
        uint256 _pid,
        uint256 _amount,
        bool vote
    ) public view {
        return;
    }
}
