// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://gist.github.com/SunnyNavani/04e7948ea7606e70e3e62a0be1273925#file-contracts_polygon-service-sol";

contract TokenPolygon is ERC20{

    constructor() ERC20("SunnyNavaniCoin","SNC"){
        _mint(msg.sender,1000000*(10**uint256(decimals())));
    }

    function approveAndCall (address _recipient,
                        uint256 _value,
                        bytes _extraData) public{
     approve(_recipient, _value);
    Service(_recipient).receiveApproval(msg.sender,
                                             _value,
                                             address(this),
                                             _extraData);
    }

    function transferAndCall(address _recipient,
                        uint256 _value,
                        bytes _extraData) {
  transfer(_recipient, _value);
  require(Service(_recipient).tokenFallback(msg.sender,
                                                   _value,
                                                   _extraData));
}
}
