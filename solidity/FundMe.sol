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
    addressToAmountFunded[msg.sender] += msg.value;

    //what is a revert?
    //undo any actions that have been done and send remaining gas back

    }
    
     function withdraw() public{
     //for loop
     //[1,2,3,4] elements
     // 0, 1,2,3 indexes
     // for(/*starting index, ending index, step amount*/ )
     for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
        address funder =funders[funderIndex];
        addressToAmountFunded[funder] = 0;
     }
     //reset the array
     funders = new address[](0);
     //withdraw the funds
      //transfer
      //send
      //call

     //msg.sender = address
     //payable(msg.sender) = payable address
    
     //transfer                                                   
     payable(msg.sender).transfer(address(this).balance);
     //send
     bool sendSuccess = payable(msg.sender).send(address(this).balance);
     require(sendSuccess, "Send failed");
     //call
     (bool callSuccess, ) = payable (msg.sender).call{value:address(this).balance}("");
     require(callSuccess, "Call failed");
     
      

     }
  
   
}

