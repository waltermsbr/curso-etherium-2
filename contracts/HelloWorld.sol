// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./ControleAcessoDono.sol";

contract HelloWorld is ControleAcessoDono {
    string texto = unicode"Hello Word";

    function hello(string calldata)
        public
        view
        apenasDono
        returns (string memory)
    {
        return texto;
    }
}
