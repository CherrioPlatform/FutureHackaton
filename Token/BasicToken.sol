pragma solidity ^0.4.19;

import "../SafeMath/SafeMath.sol";
import "./ERC20Basic.sol";

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    // Balances for each account
    mapping(address => uint256) balances;

    // Get the token balance for account
    function balanceOf(address _address) public constant returns (uint256 balance) {
        return balances[_address];
    }

    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        Transfer(msg.sender, _to, _value);

        return true;
    }
}