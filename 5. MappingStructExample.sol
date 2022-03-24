// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

contract MappingStructExmaple {

    struct Payment {
            uint amount;
            uint timestamp;

    }
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping (uint => Payment) payments; //map numPayments to struct Payment - called payments
    }

    //mapping(address => uint) public balanceReceived;
    mapping(address => Balance) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;   // balance init @0. incremented from there.

        Payment memory payment = Payment(msg.value, block.timestamp);        //payment = Payment(amt, time)
        
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
    }

    function partialWithdraw(uint _withdraw_amt, address payable _to) public {
        require(_withdraw_amt <= balanceReceived[msg.sender].totalBalance, "Balance exceeded");  //do you hav enuff to withdraw
            balanceReceived[msg.sender].totalBalance -= _withdraw_amt;       //update balances
            _to.transfer(_withdraw_amt);                                    // whr u want to send to?
    }

    function withdrawAllMoney(address payable _to) public {   //i can withdraw to addr of choice
        uint user_balance = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        // checks-effect interaction pattern 
        _to.transfer(user_balance);
    }
}

/*
:: to avoid re-entracy bug:: checks-effect-interaction pattern
1) check if you can do something - condition 
2) then ensure the internal state is updated
---- internal first. external last. protecc us.
3) finally, external interactions.

*/