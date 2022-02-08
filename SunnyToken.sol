// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC20/ERC20.sol)
pragma solidity 0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/SunnyNavani/Contracts/blob/main/TokenService.sol";

contract SunnyToken is ERC20{

    constructor() ERC20("SunnyNavaniCoin","SNC"){
        _mint(msg.sender,1000000*(10**uint256(decimals())));
    }

  
    function transferAndCall(address _recipient, uint256 _value, bytes _extraData) public {
        transfer(_recipient, _value);
        require(tokenFallback(_recipient, _value, _extraData));
}
}
