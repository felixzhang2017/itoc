pragma solidity ^0.4.11;

import "./ownership/Claimable.sol";
import "./ownership/Contactable.sol";
import "./ownership/HasNoEther.sol";
import "./token/FreezableToken.sol";

/**
 * @title ITOC
 * @dev The ITOC contract is Claimable, and provides ERC20 standard token.
 */
contract ITOC is Claimable, Contactable, HasNoEther, FreezableToken {
    // @dev Constructor initial token info
    function ITOC(){
        uint256 _decimals = 18;
        uint256 _supply = 100000000*(10**_decimals);

        _totalSupply = _supply;
        balances[msg.sender] = _supply;
        name = "ITOChain Coin";
        symbol = "ITOC";
        decimals = _decimals;
        contactInformation = "ITOChain Coin contact information";
    }
}
