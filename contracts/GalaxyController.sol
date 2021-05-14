/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;

contract GalaxyController {
    struct Predictions {
        address writer;
        uint256 endTime;
        uint256 upVoteCount;
        uint256 downVoteCount;
    }

    //Dev address
    address dev;

    constructor(address _dev) {
        dev = _dev;
    }
}
