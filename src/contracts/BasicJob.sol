// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BasicJob {
  event Worked();

  error NotWorkable(uint256 _lastWorkAt);

  mapping(address => uint256) public lastWorkAt;

  function workable(address _worker) public view returns (bool _workable) {
    return block.timestamp - lastWorkAt[_worker] < 180;
  }

  function work() public {
    if (!workable(msg.sender)) revert NotWorkable(lastWorkAt[msg.sender]);
    emit Worked();
  }
}
