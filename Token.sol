// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token{
    address public minter;

    mapping(address => uint) public balances;

    event Minted(address holder, uint qtyMinted);

    constructor(){
        minter = msg.sender;
    }

    function mint(address _minter, uint amount) public {
        require(msg.sender == minter);
        balances[_minter] += amount;
        emit Minted(_minter, amount);
    }

}