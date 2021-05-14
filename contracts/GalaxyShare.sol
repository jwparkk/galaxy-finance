/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title GalaxyShare
/// @notice User enter or leave Galaxy Pool through gToken or share.
contract GalaxyShare is ERC20("GalaxyShare", "xGALA") {
    //using SafeMath for uint256;
    IERC20 public galaxy;

    // Define the Galaxy token contract
    constructor(IERC20 _galaxy) public {
        galaxy = _galaxy;
    }

    /// @notice Stake `_amount` of GALA token to pool and get xGALA token as a share
    /// @dev TODO
    /// @param _amount number of Gala token
    function enter(uint256 _amount) public {
        return;
    }

    /// @notice Return `_share` and get back GALA token
    /// @dev TODO
    /// @param _share number of `xGALA` token
    function leave(uint256 _share) public {
        return;
    }
}
