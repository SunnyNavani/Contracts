// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)
pragma solidity 0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/SunnyNavani/Contracts/blob/main/Service.sol";

contract TokenService {

   function tokenFallback(address _sender, uint256 _value, bytes _extraData) returns (bool) {
    require(_sender == SunnyToken);
    require(_value == 1);
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
