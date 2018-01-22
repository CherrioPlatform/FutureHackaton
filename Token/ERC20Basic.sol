pragma solidity ^0.4.19;

/**
 * @title ERC20 Interface
 * @dev https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Basic {
    uint256 public totalSupply;

    function balanceOf(address _address) public constant returns(uint256 balance);
    function transfer(address _to, uint256 _value) public returns(bool success);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}