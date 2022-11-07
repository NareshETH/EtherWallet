// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract EtherWallet{

 
 address payable owner;

//it makes the deployer of this contract as owner
 constructor(){

     owner = payable (msg.sender);
 }

 //to receive ether 
 receive()external payable{}


 error CallFailed();

//Any one can deposit ether, only owner of this contract can withdraw
 function withdraw(uint256 _amount)external payable{

     require(owner == payable (msg.sender),"only owner can withdraw");


     (bool success,) = payable (msg.sender).call{value:_amount}("");

     if(!success){

     revert CallFailed();

   }

 }

 //returns the balance of this contract
 function getBalance()public view returns(uint256){
  
  return address(this).balance;


 }


}



