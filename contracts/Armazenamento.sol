// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./ArmazenamentoInterface.sol";
import "./ControleAcessoDono.sol";

contract Armazenamento is ArmazenamentoInterface, ControleAcessoDono {
    string armazenado = "";

    function guardar(string memory texto) public apenasDono {
        armazenado = texto;
    }

    function recuperar() public view returns (string memory) {
        return armazenado;
    }
}
