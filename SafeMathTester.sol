// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber =255 ; // unchecked

    function add() public{
       // bigNumber = bigNumber + 1; //syntax for  sol version 0.6.0
       unchecked {bigNumber = bigNumber + 1;}

    }

}