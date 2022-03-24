// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract SendMoneyExample {

    uint public balanceReceived;                //public state variable -> getter function auto-created.
    uint public lockedUntil;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockedUntil = block.timestamp +1 minutes;         //will not account for withdrawls as it only increments.
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

    function withdrawMoneyTO(address payable _to) public {
        if(block.timestamp > lockedUntil){
            _to.transfer(getBalance());
        }
            
    }
}