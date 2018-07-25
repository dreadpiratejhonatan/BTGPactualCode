pragma solidity ^0.4.24;

contract BTGPactualCode {

  // Options Struct and Array
  struct Option {
    uint id;
    uint owner;
    uint strikePrice;
    string type; // Types must be "put" or "call"
    uint premium;
  }

  Option[] public optionsList;

  uint optionsCounter;

  // Clients Struct and Array
  struct Client {
    uint id;
    int balance;
  }

  Client[] private clientsList;


  // ----> Challenge 1 <----
  // Functions to add new options and see already available ones.

  function addOption(uint _owner, uint _strikePrice, string _type, uint _premium) public {
    optionsCounter = optionsList.push(Option(optionsCounter,_owner,_strikePrice,_type,_premium));
  }

  function seeOptions() public {

  }


  // ----> Challenge 2 <----
  // Record purchase and sales operations.

  struct Record {
    uint whoSold;
    uint whoBought;
    uint option;
    uint transactionValue;
  }

  Record[] private records;

  function buyOption(uint _buyerId, uint _optionId, uint _howManyDollars) public {
    if ( clientsList[_buyerId].balance >= optionsList[_optionId].premium*_howManyDollars ) {
      uint optionOwner = optionsList[_optionId].owner;
      clientsList[_buyerId].balance = clientsList[_buyerId].balance - optionsList[_optionId].premium*_shares;
      clientsList[optionOwner].balance = clientsList[optionOwner].balance + optionsList[_optionId].premium*_shares;
      optionsList[_optionId].owner = _buyerId;
    }
  }

}
