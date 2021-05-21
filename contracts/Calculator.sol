// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Calculator {
    /* STATE VARIABLES */
    //Pas de Variables, car simple calculatrice

    /* EVENTS */
    //Pas d'event, car simple calculatrice

    /* CONSTRUCTOR */
    //Pas de constructor, car simple calculatrice

    /* MODIFIER */
    //Pas de Modifier, car simple calculatrice

    /* FUNCTIONS */
    //Si l'on avait mis la function en "pure", on enlèverait les "emit et event" qui sont surtout utilisé pour du "payable"
    function add(int256 nb1, int256 nb2) public pure returns (int256) {
        return nb1 + nb2;
    }

    function sub(int256 nb1, int256 nb2) public pure returns (int256) {
        return nb1 - nb2;
    }

    function mul(int256 nb1, int256 nb2) public pure returns (int256) {
        return nb1 * nb2;
    }

    function div(int256 nb1, int256 nb2) public pure returns (int256) {
        require(nb2 > 0, "Calculator: cannot divide by zero");
        return nb1 / nb2;
    }

    function mod(int256 nb1, int256 nb2) public pure returns (int256) {
        return nb1 % nb2;
    }
}
