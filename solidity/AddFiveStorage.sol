// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//inheriting simpleStorage.sol
import {SimpleStorage} from "./simpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    //+5
    //Overrides
    // virtual overrides
    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;

    }

}