/*
Goals
get funds from users
withdraw funds
set a minimum funding value in USD
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function fund() public payable{     
    require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough Eth"); // 1ETH = 1**18 Wei
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    //what is a revert?
    //undo any actions that have been done and send remaining gas back

    }
    
   // function withdraw() public{}

   
}

