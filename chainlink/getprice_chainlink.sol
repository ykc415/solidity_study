// SPDX-License-Identifier : MIT
pragma solidity >= 0.8.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network : Goerli
     * Aggregator: ETH/USD
     * Address: 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }

    function getDecimals() external view returns (uint8) {
        uint8 dec = priceFeed.decimals();
        return dec;
    }

    function getDescription() external view returns (string memory) {
        string memory des = priceFeed.description();
        return des;
    }

    /** 121807000000 / (10**8) = 1218.07
     * 
     *  Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundId*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }
    

}