if (typeof web3 !== 'undefined') {
    web3js = new Web3(web3.currentProvider);
} else {
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    web3js = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}
// web3.eth.getAccounts((error, accounts) => {
//         if (!error) {
//         web3.eth.defaultAccount = accounts[0];
//     }
//     else {
//         console.log('Some error occurred.');
//     }
// });
// web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545'));

console.log(web3);
console.log(web3.eth.accounts[0]);

jQuery(document).ready(function() {
    console.log( "ready!" );
});

