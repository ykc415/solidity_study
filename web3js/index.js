import Web3 from "web3";
import Subscribe from "./subscribe.js";

const web3 = new Web3(new Web3.providers.WebsocketProvider("wss://mainnet.infura.io/ws/v3/fdec8e5f97184782acaa5f1ec925919a"));


const foundation_token_address = "0x3B3ee1931Dc30C1957379FAc9aba94D1C48a5405";
const foundation_market_address = "0xcDA72070E455bb31C7690a170224Ce43623d0B6f";


const transfer_topic = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef";
const market_list_topic = web3.utils.sha3("ReserveAuctionCreated(address,address,uint256,uint256,uint256,uint256,uint256)");
const market_sold_topic = web3.utils.sha3("ReserveAuctionFinalized(uint256,address,address,uint256,uint256,uint256)");

Subscribe(foundation_token_address, transfer_topic, "TRANSFER");
Subscribe(foundation_market_address, market_list_topic, "TRANSFER");
Subscribe(foundation_market_address, market_sold_topic, "TRANSFER");



