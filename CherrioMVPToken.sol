pragma solidity ^0.4.19;

import './SafeMath/SafeMath.sol';
import './Token/StandardToken.sol';
import './Ownable/Ownable.sol';

contract CherrioMVPToken is StandardToken, Ownable {
    using SafeMath for uint256;

    // Metadata
    string public constant name = "Cherrio MVP Token";
    string public constant symbol = "CMT";
    uint8  public constant decimals = 18;

    // Beneficiary address
    address public beneficiary;
    address public emergencyPool;

    // Capaign constants
    uint256 public constant INITIAL_SUPPLY = 200000 * (10 ** uint256(decimals));
    uint256 public constant CAMPAIGN_CAP   = 500 finney;
    uint8   public constant NUM_OF_TOKENS  = 1;

    // Public properties
    address[] public voteUp;
    address[] public voteDown;
    uint256   public etherReceived;
    uint256   public numberOfDonators;

    bool public isCampaignEnded;
    bool public firstWithdraw;
    bool public secondWithdraw;

    // Private properties
    bool canVote;

    struct Voter {
        uint8 vote;
        bool  hasVoted;
    }

    // All accounts who voted
    mapping(address => Voter) voters;

    // Checks if campaign is already ended
    modifier IsCampaignEnded() {
        require(!isCampaignEnded);

        _;
    }

    // Checks if donator can vote
    modifier CanVote() {
        require(canVote);

        _;
    }

    /**
     * The listed addresses are not valid recipients of tokens.
     *
     * 0x0         - The zero address is not valid
     * this        - The contract itself should not receive tokens
     * owner       - The owner has all the initial tokens, but cannot receive any back
     * beneficiary - The address of campain who receives tokens after campaign is finished
     */
    modifier CheckValidAddressDestination(address _to) {
        require(
            _to != address(0x0) &&
            _to != address(this) &&
            _to != owner &&
            _to != beneficiary
        );

        _;
    }

    // This notifies clients about the amount burnt
    event Burn(address indexed from, uint256 value);

    // Constructor
    function CherrioMVPToken(address _beneficiary, address _emergencyPool) public {
        totalSupply = INITIAL_SUPPLY;

        balances[msg.sender] = totalSupply;

        beneficiary = _beneficiary;
        emergencyPool = _emergencyPool;
    }

    function () public IsCampaignEnded CheckValidAddressDestination(msg.sender) payable {
        require(msg.value > 0);

        uint256 availableEthers = getAvailableEthers();
        uint256 refund = 0;

        if(msg.value >= availableEthers) {
            refund = msg.value.sub(availableEthers);
            msg.sender.transfer(refund);

            isCampaignEnded = true;
            withdrawFunds(false, false);
        }

        etherReceived = etherReceived.add(msg.value.sub(refund));

        if(balances[msg.sender] == 0) {
            numberOfDonators++;
        }

        balances[owner] = balances[owner].sub(NUM_OF_TOKENS);
        balances[msg.sender] = balances[msg.sender].add(NUM_OF_TOKENS);
    }

    function getAvailableEthers() internal view returns(uint256) {
        return CAMPAIGN_CAP.sub(etherReceived);
    }

    function setCampaignEnded() external onlyOwner {
        isCampaignEnded = true;

        withdrawFunds(false, false);
    }

    function addVote(uint8 _vote) public CanVote {
        require(
            balances[msg.sender] > 0 &&
        !voters[msg.sender].hasVoted
        );

        voters[msg.sender].vote = _vote;
        voters[msg.sender].hasVoted = true;

        if(_vote > 0) {
            voteUp.push(msg.sender);
        }
        else {
            voteDown.push(msg.sender);
        }

        checkVotesRate();
    }

    function checkVotesRate() internal returns(bool) {
        if(secondWithdraw) {
            return;
        }

        uint256 result;

        if(voteUp.length > 0) {
            result = numberOfDonators.div(voteUp.length);

            if(result <= 2) {
                withdrawFunds(true, false);
            }
        }
        if(voteDown.length > 0) {
            result = numberOfDonators.div(voteDown.length);

            if(result <= 2) {
                withdrawFunds(true, true);
            }
        }
    }

    function withdraw() external IsCampaignEnded onlyOwner {
        checkVotesRate();
    }

    /**
     * @param _transferSecondWithdraw True if votes has already been checked
     */
    function withdrawFunds(bool _transferSecondWithdraw, bool _transferToEmergencyPool) internal {
        if(!firstWithdraw) {
            firstWithdraw = true;
            canVote = true;

            beneficiary.transfer(this.balance.div(2));
        }
        else {
            if(!secondWithdraw) {
                if(_transferSecondWithdraw) {
                    secondWithdraw = true;

                    if(!_transferToEmergencyPool) {
                        beneficiary.transfer(this.balance);
                    }
                    else {
                        emergencyPool.transfer(this.balance);
                    }
                }
            }
        }
    }

    function getBalance() public view returns(uint256) {
        return this.balance;
    }

    function getBeneficiaryBalance() public view returns(uint256) {
        return beneficiary.balance;
    }

    function getEmergencyPoolBalance() public view returns(uint256) {
        return emergencyPool.balance;
    }

    function getCanVote() public view returns(bool) {
        return canVote;
    }

    function getVoterVote(address _address) public view returns(uint256) {
        return voters[_address].vote;
    }

    function checkIfVoted(address _address) public view returns(bool) {
        return voters[_address].hasVoted;
    }
}