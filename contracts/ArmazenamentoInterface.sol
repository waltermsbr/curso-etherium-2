// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface ArmazenamentoInterface {
    function guardar(string memory texto) external;

    function recuperar() external returns (string memory);
}
