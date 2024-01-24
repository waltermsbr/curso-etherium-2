// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
    Crie um contrato que implemente a interface SimpleExchange
**/

interface SimpleExchange {
    struct Offer {
        uint256 amountToSell;
        IERC20 tokenToSell;
        address seller;
        uint256 amountToBuy;
        IERC20 tokenToBuy;
    }

    //Offer[] public offers;

    function getOffersLength() external view returns (uint256);

    function putOffer(
        uint256 amountToSell,
        IERC20 tokenToSell,
        uint256 amountToBuy,
        IERC20 tokenToBuy
    ) external;

    function acceptOffer(uint256 index) external;

    function cancelOffer(uint256 index) external;

    //function deleteOffer(uint index) internal;
}
