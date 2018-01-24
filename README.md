# Vision & Roadmap

Read our [Vision & Roadmap](https://github.com/CherrioPlatform/FutureHackaton/wiki/Vision-&-Roadmap).

# Demo

Check out our [LIVE DEMO](http://futurehack.cherr.io/).

# Installation guide

### Prerequisites:

Install local environment with Apache server and MySQL database using this tutorial: 

https://netbeans.org/kb/docs/php/configure-php-environment-windows.htm (Windows)

or

https://www.ntu.edu.sg/home/ehchua/programming/webprogramming/AMP_Setup.html (Linux)

Get `git` client from:

https://git-scm.com/downloads

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
- Update config file (application/config/database.php) with connections string and authentication data from your database server. If used on same machine, you can use `localhost`.
- Update Twitter and Facebook authorization tokens (application/config/constants.php):
```bash
TWITTER_CONSUMER_KEY
TWITTER_CONSUMER_SECRET
FACEBOOK_ID
```

## Smart Contract

### Requirements: 

All smart contracts should be deployed on Rinkeby Ethereum Network (Solidity v.0.4.19 used)

### Installation:

- Checkout **smart-contracts** branch:
```bash
git checkout https://github.com/CherrioPlatform/FutureHackaton.git
```
- Deploy `campaignToken.sol` using environment of your choice (e.g. Online Solidity Browser version 0.4.20 commit)
- Check on Etherscan.io for smart contract's address.

### Usage:

To use some of our features (e.g. voting for campaign documents), you need to install `MetaMask` plugin. MetaMask should be used with Rinkeby Ethereum Network. We kindly suggest to create new ETH address when Rinkeby Ethereum Network is selected.
This ETH address should be used in registration and also when sending Ethers.

How to install MetaMask you can check here: https://www.cryptocompare.com/wallets/guides/how-to-use-metamask/