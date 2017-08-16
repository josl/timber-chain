pragma solidity ^0.4.11;

import "./Manager.sol";
import "./Transaction.sol";
import "./ContractProvider.sol";


contract SupplyChainManager is ManagerEnabled {

  // We still want an owner.
  address owner;

  // Constructor
  function SupplyChainManager(){
    owner = msg.sender;
  }

  function hasTokens(address actor, bytes32 species, uint value) returns (bool) {
      // Only the Tx contract can check if the address has tokens
      address transaction = ContractProvider(MANAGER).contracts("transaction");
      require(transaction != 0x0);
      // Use the interface to call on the transaction contract
      bool success = Transaction(transaction).hasTokens(actor, species, value);
      return success;
  }




/*
  // Attempt to register a sample
  function submitSample(bytes32 ipfshash, uint hashFunc, uint length) returns (bool res) {
    // FIXME: Check for empty strings!
    address sample = ContractProvider(MANAGER).contracts("sample");
    require(sample != 0x0);


  // Attempt to register a sample
  function extractSample(uint sampleOff) constant returns (bytes32, uint, uint) {
    address sample = ContractProvider(MANAGER).contracts("sample");
    require(sample != 0x0);
    // Use the interface to call on the sample contract.
    return Sample(sample).access(msg.sender, sampleOff);
  }*/
}
