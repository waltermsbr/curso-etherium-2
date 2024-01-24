// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld {
    string texto = unicode"Hello Word";
    address dono;

    constructor() {
        dono = msg.sender;
    }

    modifier apenasDono() {
        require(msg.sender == dono, "Apenas o dono pode chamar esta funcao");
        _;
    }

    function hello(string calldata)
        public
        view
        apenasDono
        returns (string memory)
    {
        return texto;
    }
}
