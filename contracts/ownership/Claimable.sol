pragma solidity ^0.4.11;

import './Ownable.sol';

/**
 * @title Claimable
 * @dev the ownership of contract needs to be claimed.
 * This allows the new owner to accept the transfer.
 */
contract Claimable is Ownable {
    address public pendingOwner;

    // @dev Modifier throws if called by any account other than the pendingOwner.
    modifier onlyPendingOwner() {
      require(msg.sender == pendingOwner);
      _;
    }

    // @dev Allows the current owner to set the pendingOwner address.
    // @param newOwner The address to transfer ownership to.
    function transferOwnership(address newOwner) onlyOwner {
      pendingOwner = newOwner;
    }

    // @dev Allows the pendingOwner address to finalize the transfer.
    function claimOwnership() onlyPendingOwner {
      owner = pendingOwner;
      pendingOwner = 0x0;
    }
}
