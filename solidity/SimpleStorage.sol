// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // solidity versions

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
 
//  Person public pat = Person({favoriteNumber: 7, name:"Pat"});
//  Person public mariah = Person({favoriteNumber: 16, name:"Mariah"});
//  Person public jon = Person({favoriteNumber: 12, name:"Jon"}); 
// to save time listOfPeople is created
   


 function store(uint256 _favoriteNumber) public{
   myFavoriteNumber = _favoriteNumber;
   
 }
 // view function disallows updating state, pure
 function retrieve() public view returns(uint256){
    return myFavoriteNumber;
 }
 function addPerson(string memory _name, uint256 _favoriteNumber) public{
   listOfPeople.push(Person(_favoriteNumber, _name));
 }
}