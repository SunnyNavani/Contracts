//"SPDX-License-Identifier: UNLICENSED"
pragma solidity =0.8.1;
import "https://github.com/SunnyNavani/Contracts/blob/main/TokenPolygon.sol";

contract Service{

    function receiveApproval(address _sender,
                            uint256 _value,
                            TokenPolygon _tokenContract,
                            bytes _extraData) public{
      require(_tokenContract == TokenPolygon);
      require(tokenContract.transferFrom(_sender, address(this), 1));
      uint256 payloadSize;
      uint256 payload;
      assembly {
        payloadSize := mload(_extraData)
        payload := mload(add(_extraData, 0x20))
      }
      payload = payload >> 8*(32 - payloadSize);
      info[_sender] = payload;
    }

    function tokenFallback(uint256 _value,
                          bytes _extraData) returns (bool) {
      require(msg.sender == TokenPolygon);
      require(_value >= 1);
      uint256 payloadSize;
      uint256 payload;
      assembly {
        payloadSize := mload(_extraData)
        payload := mload(add(_extraData, 0x20))
      }
      payload = payload >> 8*(32 - payloadSize);
      info[sender] = payload;
      return true;
    }
}
