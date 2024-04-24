/*
Goals
get funds from users
withdraw funds
set a minimum funding value in USD
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

//Gas Optimization
//constant and immutable keywords to bring down the cost
//without constant and immutable keywords gas will be higher
//target the require keyword and revert

error NotOwner();

contract FundMe{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18; //5*10**18

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    

    address public immutable i_owner;
    constructor() {
        i_owner = msg.sender;
    }
    function fund() public payable{     
    require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't send enough Eth"); // 1ETH = 1**18 Wei
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;

    //what is a revert?
    //undo any actions that have been done and send remaining gas back

    }    
     function withdraw() public{
//require (msg.sender ==owner, "Must be owner!"); deleted to modifier
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
     //payable(msg.sender) = payable  

     //transfer                                                   
     payable(msg.sender).transfer(address(this).balance);
     //send
     bool sendSuccess = payable(msg.sender).send(address(this).balance);
     require(sendSuccess, "Send failed");
     //call
     (bool callSuccess, ) = payable (msg.sender).call{value:address(this).balance}("");
     require(callSuccess, "Call failed");  
     revert(); 
     
     }  
   //modifier
   modifier  onlyOwner() {
    //require(msg.sender == i_owner, "Sender is not owner!");
     if(msg.sender != i_owner)  {
        revert NotOwner();
     }
    _; //the require function is executed first then underscore executes the code in withdraw funct afterwards depending on the position of the _;
     
   }
   //What happens if someone sends this contract Eth without calling fund function

   //functions in solidity
   //1. receive
   //2. fallback

}

// compile and deploy this contract
//fund it
// withdraw it using remix
//and the owner account
// optimize gas