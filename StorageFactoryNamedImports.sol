//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//creating a contract in a contract

// Using imports contain this : import "./simpleStorage.sol"; 
//Make use of named imports for cheap deployment
import {SimpleStorage} from "./simpleStorage.sol"; 
contract StorageFactory{
   
    SimpleStorage[] public listOfSimpleStorageContracts;


    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
        
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        // to interact with the contract you need
        //Address
        //ABI (application binary interface) (technically a lie, you need the function selector)
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }

} 