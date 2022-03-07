//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Score {
    mapping(address => uint256) score;
    address teacher;

    constructor(address teacherAddress) {
        teacher = teacherAddress;
    }

    modifier _onlyTeacher() {
        require(msg.sender == teacher);
        _;
    }

    function add(uint256 amount) external _onlyTeacher {
        require(score[msg.sender] + amount <= 100);
        score[msg.sender] += amount;
    }

    function mod(uint256 amount) external _onlyTeacher {
        score[msg.sender] -= amount;
    }
}

contract Teacher {
    Score score;

    constructor(address teacherAddress) {
        score = Score(teacherAddress);
    }

    function add(uint256 amount) external {
        score.add(amount);
    }

    function mod(uint256 amount) external {
        score.mod(amount);
    }
}