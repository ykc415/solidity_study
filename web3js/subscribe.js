import Web3 from "web3";
import InsertToDB from "./dbutil.js";

const web3 = new Web3(new Web3.providers.WebsocketProvider("wss://mainnet.infura.io/ws/v3/fdec8e5f97184782acaa5f1ec925919a"));

function Subscribe(contract_address, topic, type) {

    web3.eth.subscribe("logs", {
        address: contract_address,
        topics: [topic]
    }, (err, result) => {
        if (err) {
            console.error(error);
        } else {
            console.log("*************************************");
            console.log("New Transaction Event");
            console.log(type);
            console.log("*************************************")
           
            getReceiptFindTransfer(result.transactionHash, type);
        }
    })
}

async function getReceiptFindTransfer(txid, type) {

    web3.eth.getTransactionReceipt(txid)
        .then((result) => {
            var logs = result.logs;
            for (const log of logs) {
                var topics = log.topics;
                if (topics[0] == "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef") {
                    console.log("***********************************")
                    console.log("FIND Transfer log")
                    console.log("***********************************")
                
                    var token_id = topics[3];
                    var new_owner = topics[2];
                    var before_owner = topics[1];
                    var contract_address = log.address;
                    token_id = web3.utils.hexToNumberString(token_id);

                    InsertToDB(contract_address,token_id,type,before_owner,new_owner);
                }
            }
        })
}

export default Subscribe;
