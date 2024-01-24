// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./CasaDeCambioAbstract.sol";
import "./OWFToken.sol";

contract CasaDeCambio is CasaDeCambioAbstract {
    mapping(uint256 => Oferta) public ofertas;
    uint256 public _totalDeOfertas = 1;

    struct Oferta {
        uint256 id;
        uint256 quantidadeTokens;
        uint256 precoLote;
        bool status;
    }

    OWFToken public token;

    constructor(address uid) {
        token = OWFToken(uid);
    }

    function realizaOferta(uint256 _quantidadeTokens, uint256 _precoLote)
        public
        virtual
        override
        apenasDono
    {
        require(_quantidadeTokens > 0, "Quantidade de Tokens maior que zero.");
        require(_precoLote > 0, unicode"Preço de Lote maior que zero.");
        token.transferFrom(dono, msg.sender, _quantidadeTokens);
        Oferta memory novaOferta = Oferta(
            _totalDeOfertas,
            _quantidadeTokens,
            _precoLote,
            true
        );
        ofertas[_totalDeOfertas] = novaOferta;
        emit ofertaRealizada(_totalDeOfertas++, _quantidadeTokens, _precoLote);
    }

    function compra(uint256 id) public payable virtual override {
        require(
            ofertas[id].precoLote == msg.value,
            unicode"Preço de Lote incorreto."
        );
        require(ofertas[id].status == true, unicode"Oferta não disponível.");
        token.transfer(msg.sender, ofertas[id].quantidadeTokens);
        ofertas[id].status = false;
    }

    function consultaOfertas()
        public
        view
        virtual
        override
        returns (uint256, uint256)
    {
        uint256 _qtdeOfertas = 0;
        uint256 _idInicial = 0;
        for (uint256 x = 0; x <= _totalDeOfertas; x++) {
            if (ofertas[x].status == true) {
                if (_idInicial == 0) {
                    _idInicial = ofertas[x].id;
                }
                _qtdeOfertas++;
            }
        }
        return (_qtdeOfertas, _idInicial);
    }

    function listaOfertas() public view virtual returns (Oferta[] memory) {
        Oferta[] memory ofertasAtivas;
        for (uint256 x = 0; x <= _totalDeOfertas; x++) {
            if (ofertas[x].status == true) {
                ofertasAtivas[ofertas[x].id] = ofertas[x];
            }
        }
        return ofertasAtivas;
    }
}
