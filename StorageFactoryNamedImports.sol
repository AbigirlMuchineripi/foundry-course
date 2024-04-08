//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// Using imports contain this : import "./simpleStorage.sol"; 
//Make use of named imports for cheap deployment
import {SimpleStorage, SimpleStorage2} from "./simpleStorage.sol"; 
contract StorageFactory{
   
    SimpleStorage public simpleStorage;


    function createSimpleStorageContract() public{
        simpleStorage = new SimpleStorage();
        
    }
} 