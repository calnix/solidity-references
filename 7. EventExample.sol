//SPDX-License-Identifier: MIT

pragma solidity 0.8.3;

contract EventExampel {

    mapping(address => uint) public tokenBalance;
    
    event TokenSent(address _from, address _to, uint _amount);

    constructor(){
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool){
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokenSent(msg.sender, _to, _amount);
        return true;
    }

}

/*
cannot return anything outside the SC. 
if you say return true, the user interacting with it will not receive it as output.
To achieve this, use events. 
*/