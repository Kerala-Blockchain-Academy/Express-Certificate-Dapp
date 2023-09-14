// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Cert {
    address admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, 'Access Denied');
        _;
    }

    struct Certificate {
        string course;
        string name;
        string grade;
        string date;
    }

    mapping(uint256 => Certificate) public Certificates;

    function issue(
        uint256 _id,
        string memory _course,
        string memory _name,
        string memory _grade,
        string memory _date
    ) public onlyAdmin {
        Certificates[_id] = Certificate(_course, _name, _grade, _date);
    }
}
