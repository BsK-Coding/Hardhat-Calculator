// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Calculator {
    /* STATE VARIABLES */
    mapping(address => uint256) private _balances;
    address private _owner;

    /* EVENTS */
    event Add(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Sub(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Mul(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Div(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Mod(address indexed account, int256 nb1, int256 nb2, int256 res);

    /* CONSTRUCTOR */
    constructor(address owner_) {
        _owner = owner_;
    }

    /* MODIFIER */
    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "Ownable: Only owner can call this function"
        );
        _;
    }

    /* FUNCTIONS */
    function add(int256 nb1, int256 nb2) public returns (int256) {
        emit Add(msg.sender, nb1, nb2, nb1 + nb2);
        return nb1 + nb2;
    }

    function sub(int256 nb1, int256 nb2) public returns (int256) {
        emit Sub(msg.sender, nb1, nb2, nb1 - nb2);
        return nb1 - nb2;
    }

    function mul(int256 nb1, int256 nb2) public returns (int256) {
        emit Mul(msg.sender, nb1, nb2, nb1 * nb2);
        return nb1 * nb2;
    }

    function div(int256 nb1, int256 nb2) public returns (int256) {
        require(
            nb2 > 0,
            "Le second nombre (Dividende) doit etre different de 0 et positif"
        );
        emit Div(msg.sender, nb1, nb2, nb1 / nb2);
        return nb1 / nb2;
    }

    function mod(int256 nb1, int256 nb2) public returns (int256) {
        emit Mod(msg.sender, nb1, nb2, nb1 % nb2);
        return nb1 % nb2;
    }

    function balances() public view returns (uint256) {
        return address(this).balance;
    }
}
