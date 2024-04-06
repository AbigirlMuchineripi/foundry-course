//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    //favoriteNumber is initialise to 0 if no number is given
 uint256 public myFavoriteNumber;// 0

 //uint256[] OfFavoriteNumbers;
 struct Person{
    uint256 favoriteNumber;
    string name;

 }
 //dynamic array has empty parameters
 // static array has a parameter
 Person[] public listOfPeople;//[]

 //mapping is like a dictionary with all keys
 mapping(string => uint256) public nameToFavoriteNumber;

 function store(uint256 _favoriteNumber) public{
   myFavoriteNumber = _favoriteNumber;
   
 }
 // view function disallows updating state, pure
 function retrieve() public view returns(uint256){
    return myFavoriteNumber;
 }
 //calldata, memory, storage,stack,code,logs
 function addPerson(string memory _name, uint256 _favoriteNumber) public{
     listOfPeople.push(Person(_favoriteNumber, _name));
     nameToFavoriteNumber[_name] = _favoriteNumber;
 }

}
contract StorageFactory{
    function createSimpleStorageContract() public{
        // how does the storage factory know what simple storage looks like?
    }
}