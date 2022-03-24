// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    
    address public owner;
    bool public is_paused;

    constructor(){
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(owner == msg.sender, "Only ownder can set pause state");
        is_paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(is_paused == false, "Contract paused");
        require(owner == msg.sender, "You are not the the owner - cannot withdraw!");
        _to.transfer(address(this).balance);
    }

    function destroyContract(address payable _to) public {
        require(owner == msg.sender, "Only ownder can destroy");
        selfdestruct(_to);

    }
}

