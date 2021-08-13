pragma solidity ^0.5.16;

import "./zombiehelper.sol";

contract ZombieBattle is ZombieHelper {
    uint256 randNonce = 0;

    function randMod(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
    }
}
