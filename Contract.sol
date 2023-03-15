// SPDX-License-Identifier: GPL-3.0
/// @title This is just for testing and learning solidity
/// @author El-Amine Bendaas
/// @notice this just does all sorts of stuff man
/// @dev pretty simple stuff just read it


pragma solidity 0.8.19;

contract Contract {
    address public minter;
    mapping(address => uint ) public balances;
        
    event Sent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }


    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    
    error InsufficientBalance(uint requested, uint availible );

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                availible: balances[msg.sender]
            });
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        
        
    }


}
