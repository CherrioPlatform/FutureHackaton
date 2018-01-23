pragma solidity ^0.4.19;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address and
 *      provides basic authorization control functions
 */
contract Ownable {
    // Public properties
    address public owner;

    // Log if ownership has been changed
    event ChangeOwnership(address indexed _owner, address indexed _newOwner);

    // Checks if address is an owner
    modifier onlyOwner() {
        require(msg.sender == owner);

        _;
    }

    // The Ownable constructor sets the owner address
    function Ownable() public {
        owner = msg.sender;
    }

    // Transfer current ownership to the new account
    function transferOwnership(address _newOwner) public onlyOwner {
        require(
            _newOwner != owner &&
            _newOwner != address(0)
        );

        ChangeOwnership(owner, _newOwner);

        owner = _newOwner;
    }
}