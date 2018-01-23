# Demo

Check out our [LIVE DEMO](http://futurehack.cherr.io/).

# Installation guide

### Prerequisites:

Install `git` client and clone FutureHackaton repository:

```bash
git clone https://github.com/CherrioPlatform/FutureHackaton.git
```

## Database

### Requirements: 

MySQL database server (tested with `MariaDB` version 10.1.24)

### Installation:

Checkout **database** branch:
```bash
git checkout https://github.com/CherrioPlatform/FutureHackaton.git
```
Execute `databaseMVP.sql` to deploy all required tables. Tables are already populated with demo data.

## Platform

### Requirements: 

Apache server that supports `PHP` (tested with `PHP` version 5.6.3)

### Installation: 

- Checkout **platform** branch:
```bash
git checkout https://github.com/CherrioPlatform/FutureHackaton.git
```
- Move all data to path, where you want to be located.
- Update config file (application/config/database.php) with connections string and authentication data from your database server. If used on same machine, you can use localhost.
- Update Twitter and Facebook authorization tokens (application/config/constants.php):
```bash
TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
FACEBOOK_ID
```

## Smart Contract

### Requirements: 

All smart contracts should be deployed on Rinkeby Ethereum testnet (Solidity v.0.4.19 used)

### Installation:

- Checkout **smart-contracts** branch:
```bash
git checkout https://github.com/CherrioPlatform/FutureHackaton.git
```
- Deploy `campaignToken.sol` using environment of your choice (e.g. Online Solidity Browser version 0.4.20 commit)
- Check on Etherscan.io for smart contract's address.