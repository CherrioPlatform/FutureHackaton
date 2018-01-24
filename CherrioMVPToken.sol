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

    mapping(address => Voter) voters;

    modifier IsCampaignEnded() {
        require(!isCampaignEnded);

        _;
    }

    modifier CanVote() {
        require(canVote);

        _;
    }

    /**
     * The listed addresses are not valid recipients of tokens.
     *
     * 0x0           - The zero address is not valid
     * this          - The contract itself should not receive tokens
     * owner         - The owner has all the initial tokens, but cannot receive any back
     * beneficiary   - The address of campain who receives tokens after campaign is finished
     * emergencyPool - The address of emergency pool
     */
    modifier CheckValidAddressDestination(address _to) {
        require(
            _to != address(0x0) &&
            _to != address(this) &&
            _to != owner &&
            _to != beneficiary &&
            _to != emergencyPool
        );

        _;
    }

    // This notifies clients about the amount burnt
    event Burn(address indexed from, uint256 value);

    /**
     * @dev constructor
     * @param _beneficiary   The address of beneficiary
     * @param _emergencyPool The address of emergency pool
     */
    function CherrioMVPToken(address _beneficiary, address _emergencyPool) public {
        totalSupply = INITIAL_SUPPLY;

        balances[msg.sender] = totalSupply;

        beneficiary = _beneficiary;
        emergencyPool = _emergencyPool;
    }

    /**
     * @dev Fallback function that validates:
     * - if campaing reached hard cap or time expired
     * - if conditions are met
     */
    function () public IsCampaignEnded CheckValidAddressDestination(msg.sender) payable {
        require(msg.value > 0);

        uint256 availableEthers = getAvailableEthers();

        require(msg.value <= availableEthers);

        etherReceived = msg.value;

        if(balances[msg.sender] == 0) {
            numberOfDonators++;
        }

        balances[owner] = balances[owner].sub(NUM_OF_TOKENS);
        balances[msg.sender] = balances[msg.sender].add(NUM_OF_TOKENS);

        if(etherReceived == CAMPAIGN_CAP) {
            withdrawFunds(false, false);
        }
    }

    function getAvailableEthers() internal view returns(uint256) {
        return CAMPAIGN_CAP.sub(etherReceived);
    }

    function setCampaignEnded() external onlyOwner {
        isCampaignEnded = true;

        withdrawFunds(false, false);
    }

    /**
     * @dev Gives voting permission to donator
     * @param _vote Possible value of 1 or 0
     */
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

    /**
     * @dev Checks if outcome of voting:
     * - is positive (more than 50% of donators voted with 1)
     * - is negative (more than 50% of donators voted with 0)
     */
    function checkVotesRate() internal {
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
     * @dev Withdraw funds to beneficiary address or to emergency pool address
     * @param _transferSecondWithdraw True if votes has already been checked
     * @param _transferToEmergencyPool When true, funds automatically transferred to emergency pool
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

    function getTokens() public pure returns(uint256) {
        return NUM_OF_TOKENS;
    }

    function getTotalSupply() public view returns(uint256) {
        return totalSupply;
    }

    function getCap() public pure returns(uint256) {
        return CAMPAIGN_CAP;
    }

    function getCanVote() public view returns(bool) {
        return canVote;
    }

    function getBalance() public view returns(uint256) {
        return this.balance;
    }

    function getBeneficiaryBalance() public view returns(uint256) {
        return beneficiary.balance;
    }

    function getPoolBalance() public view returns(uint256) {
        return emergencyPool.balance;
    }

    function getVoterVote(address _address) public view returns(uint256) {
        return voters[_address].vote;
    }

    function checkIfVoted(address _address) public view returns(bool) {
        return voters[_address].hasVoted;
    }
}