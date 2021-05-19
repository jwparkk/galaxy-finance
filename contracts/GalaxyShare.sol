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
    /// @param _amount number of Gala token
    function enter(uint256 _amount) public {
        // Gets the amount of galaxy locked in the contract
        uint256 totalGalaxy = galaxy.balanceOf(address(this));
        // Gets the amount of xGALA in existence
        uint256 totalShares = totalSupply();

        // If no xGALA exists, mint it 1:1 to the amount put in
        if (totalShares == 0 || totalSushi == 0) {
            _mint(msg.sender, _amount);
        } else {
            // Calculate and mint the amount of xGALA the GALA is worth.
            // The ratio will change overtime, as xGALA is burned/minted and GALA deposited + gained from fees.
            uint256 what = _amount.mul(totalShares).div(totalGalaxy);
            _mint(msg.sender, what);
        }
        // Lock the Sushi in the contract
        sushi.transferFrom(msg.sender, address(this), _amount);
        return;
    }

    /// @notice Unlock the GALA token and burns xGALA
    /// @param _share number of `xGALA` token
    function leave(uint256 _share) public {
        uint256 totalShares = totalSupply();
        // Calculates the amount of Sushi the xSushi is worth
        uint256 what =
            _share.mul(galaxy.balanceOf(address(this))).div(totalShares);
        _burn(msg.sender, _share);
        sushi.transfer(msg.sender, what);
        return;
    }
}
