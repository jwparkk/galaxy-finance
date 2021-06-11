/// SPDX-License-Identifier: <SPDX-License>
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//GalaxyToken
// Deposit/Withdraw, Lockup
contract GalaxyToken is ERC20("GalaxyToken", "GALA"), Ownable {
    /// @notice Creates `_amount` token to `_to`. Must only be called by the owner.
    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
}
