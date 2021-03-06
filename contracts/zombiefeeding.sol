pragma solidity ^0.5.16;

import "./zombiefactory.sol";

contract KittyInterface {
    function getKitty(uint256 _id)
        external
        view
        returns (
            bool isGestating,
            bool isReady,
            uint256 cooldownIndex,
            uint256 nextActionAt,
            uint256 siringWithId,
            uint256 birthTime,
            uint256 matronId,
            uint256 sireId,
            uint256 generation,
            uint256 genes
        );
}

// クリプトキティーズのgetKitty()関数（コントラクト）のインターフェースを用意
// function getKitty(uint256 _id) external view returns (
//     bool isGestating,
//     bool isReady,
//     uint256 cooldownIndex,
//     uint256 nextActionAt,
//     uint256 siringWithId,
//     uint256 birthTime,
//     uint256 matronId,
//     uint256 sireId,
//     uint256 generation,
//     uint256 genes
// ) {
//     Kitty storage kit = kitties[_id];

//     // if this variable is 0 then it's not gestating
//     isGestating = (kit.siringWithId != 0);
//     isReady = (kit.cooldownEndBlock <= block.number);
//     cooldownIndex = uint256(kit.cooldownIndex);
//     nextActionAt = uint256(kit.cooldownEndBlock);
//     siringWithId = uint256(kit.siringWithId);
//     birthTime = uint256(kit.birthTime);
//     matronId = uint256(kit.matronId);
//     sireId = uint256(kit.sireId);
//     generation = uint256(kit.generation);
//     genes = kit.genes;
// }

contract ZombieFeeding is ZombieFactory {
    KittyInterface kittyContract;

    modifier ownerOfMine(uint256 _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        _;
    }

    function setKittyContractAddress(address _address) external onlyOwner {
        kittyContract = KittyInterface(_address);
    }

    function _triggerCooldown(Zombie storage _zombie) internal {
        _zombie.readyTime = uint32(now + cooldownTime);
    }

    function _isReady(Zombie storage _zombie) internal view returns (bool) {
        return (_zombie.readyTime <= now);
    }

    function feedAndMultiply(
        uint256 _zombieId,
        uint256 _targetDna,
        string memory _species
    ) internal ownerOfMine(_zombieId) {
        Zombie storage myZombie = zombies[_zombieId];
        require(_isReady(myZombie));

        _targetDna = _targetDna % dnaModulus;
        uint256 newDna = (myZombie.dna + _targetDna) / 2;
        if (keccak256(abi.encodePacked(_species)) == keccak256("kitty")) {
            newDna = newDna - (newDna % 100) + 99;
        }
        _createZombie("NoName", newDna);

        _triggerCooldown(myZombie);
    }

    function feedOnKitty(uint256 _zombieId, uint256 _kittyId) public {
        uint256 kittyDna;
        (, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);
        feedAndMultiply(_zombieId, kittyDna, "kitty");
    }
}
