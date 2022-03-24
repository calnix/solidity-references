//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    mapping (uint => mapping(uint => bool)) uintUintBoolMapping;  //not public no getter


    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }


    // getter for nested mapping
    function getNestedMap(uint _key1, uint _key2) public view returns(bool){
        return uintUintBoolMapping[_key1][_key2];
    }
}