// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {BasicJob} from 'contracts/BasicJob.sol';
import {Script} from 'forge-std/Script.sol';

contract Deploy is Script {
  // When new contracts need to be deployed, make sure to update the salt version to avoid address collition
  string public constant SALT = 'v1.0';

  function run() public {
    bytes32 _salt = keccak256(abi.encodePacked(SALT, msg.sender));

    vm.startBroadcast();
    new BasicJob{salt: _salt}();
    vm.stopBroadcast();
  }
}
