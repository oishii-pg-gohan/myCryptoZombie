pragma solidity ^0.5.16;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {}
