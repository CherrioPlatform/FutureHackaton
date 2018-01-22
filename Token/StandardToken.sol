pragma solidity ^0.4.19;

import './BasicToken.sol';
import './ERC20.sol';

contract StandardToken is BasicToken, ERC20 {
    // Owner of account approves the transfer of an amount to another account
    mapping (address => mapping (address => uint256)) allowed;

    // Returns the amount of tokens approved by the owner that can be transferred to the spender's account
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    // Token owner can approve for spender to transfer tokens from the token owner's account
    function approve(address _spender, uint256 _value) public returns(bool success) {
        require(
            allowed[msg.sender][_spender] == 0 &&
            _value > 0
        );

        allowed[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

        return true;
    }

    // Transfer tokens from one account to another account
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);

        Transfer(from, to, tokens);

        return true;
    }
}
