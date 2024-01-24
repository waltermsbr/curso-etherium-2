// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Soma {
    uint256 resultado;
    event soma(uint256 resultado);

    /**
     * pure - trata apenas informações recebidas não acessando outras variaveis do contrato
     */
    function sum(uint256 valor1, uint256 valor2) public {
        resultado = valor1 + valor2;
        emit soma(resultado);
    }

    function getResultado() public view returns (uint256) {
        return resultado;
    }

    function ehPar(uint256 valor) public pure returns (bool) {
        if (valor % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function fatorial(uint256 num) public pure returns (uint256) {
        uint256 fator = num;
        for (uint256 numero = num - 1; numero != 0; numero--) {
            fator *= numero;
        }
        return fator;
    }
}
