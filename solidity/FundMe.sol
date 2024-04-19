/*
Goals
get funds from users
withdraw funds
set a minimum funding value in USD
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function fund() public payable{

    //allow user to send $
    //have a min $ sent
    //1. How do we send Eth to this contract
    require(msg.value >= minimumUsd, "didn't send enough Eth"); // 1ETH = 1**18 Wei
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    //what is a revert?
    //undo any actions that have been done and send remaining gas back

    }
    
   // function withdraw() public{}

   function getPrice() public  view returns(uint256){
    //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    //ABI
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
     (,int256 price,,,) = priceFeed.latestRoundData();
     //Price of ETH in erms of USD
     //2000.0000000
     return uint256(price  * 1e10);
   }
   function getConversionRate(uint256 ethAmount) public view returns(uint256) {
     //1Eth?
     // 2000_000000000000000000
     uint256 ethPrice = getPrice();
     //(2000_000000000000000000 * 1_000000000000000000) /1e18;
     //$2000 =1Eth
     uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
     return ethAmountInUsd;
   }

   function getVersion() public view returns (uint256){
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
   }
}

