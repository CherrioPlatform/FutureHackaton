if (typeof web3 !== 'undefined') {
    web3js = new Web3(web3.currentProvider);
} else {
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    web3js = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

var owner = "";

cherrioContract = web3.eth.contract([
    {
        "constant": true,
        "inputs": [],
        "name": "totalSupply",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_address",
                "type": "address"
            }
        ],
        "name": "balanceOf",
        "outputs": [
            {
                "name": "balance",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "_to",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "transfer",
        "outputs": [
            {
                "name": "success",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "_from",
                "type": "address"
            },
            {
                "indexed": true,
                "name": "_to",
                "type": "address"
            },
            {
                "indexed": false,
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "Transfer",
        "type": "event"
    }
]);

var cherrio = null;

jQuery(document).ready(function() {
    web3.eth.defaultAccount = web3.eth.accounts[0];

    console.log(cherrioContract);
    // web3.eth.getBalance(e => {
    //     console.log(e);
    // })
    // cherrio = cherrioContract.at(owner);
    //
    // cherrio.geTokens((error, tokens) => {
    //     if(!error) {
    //         console.log('OK: '+tokens);
    //     }
    //     else {
    //         response.send('Some Error Occurred.');
    //     }
    // });
});

