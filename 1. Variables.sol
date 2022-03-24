pragma solidity ^0.8.0;

contract Variables{
    
    uint256 public myUint;

    // function requires 1 argument on calling it -will take a uint parameter that you supply
    // parameter is equated to myUint
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }

    bool public sumBool;

    function setBool(bool _myBool) public {
        sumBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint() public {
        myUint8++;
    }

    function decrementUint() public {
        myUint8--;
    }

    address public myAddress;

    function setAddress(address _addy) public {
        myAddress = _addy;
    }

    function getBalance(address _addy) public view returns (uint) {
        return _addy.balance;
    }

    string public myString;

    function setString(string memory _mystring) public {
        // must define memory for function arg if string
        // when you have a string (or any other reference types) you have to enter memory 
        myString = _mystring;
    }

}

// setUint(5) -> myUint =5
// you run functions from the deployed contract interface.