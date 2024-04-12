/*
Goals
get funds from users
withdraw funds
set a minimum funding value in USD
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe{
    
    function fund() public payable{
    //allow user to send $
    //have a min $ sent
    //1. How do we send Eth to this contract
    require(msg.value > 1e18, "didn't send enough Eth"); // 1ETH = 1**18 Wei
    

    //what is a revert?
    //undo any actions that have been done and send remaining gas back

    }
    
   // function withdraw() public{}
}

