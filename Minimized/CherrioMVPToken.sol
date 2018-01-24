pragma solidity ^0.4.19;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        assert(a == 0 || c / a == b);

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;

        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);

        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);

        return c;
    }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address and
 *      provides basic authorization control functions
 */
contract Ownable {
    // Public properties
    address public owner;

    // Log if ownership has been changed
    event ChangeOwnership(address indexed _owner, address indexed _newOwner);

    // Checks if address is an owner
    modifier onlyOwner() {
        require(msg.sender == owner);

        _;
    }

    // The Ownable constructor sets the owner address
    function Ownable() public {
        owner = msg.sender;
    }

    // Transfer current ownership to the new account
    function transferOwnership(address _newOwner) public onlyOwner {
        require(
            _newOwner != owner &&
            _newOwner != address(0x0)
        );

        ChangeOwnership(owner, _newOwner);

        owner = _newOwner;
    }
}

/**
 * @title ERC20 Interface
 * @dev https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20Basic {
    uint256 public totalSupply;

    function balanceOf(address _address) public constant returns(uint256);
    function transfer(address _to, uint256 _value) public returns(bool);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}

/**
 * @title ERC20 Interface
 * @dev https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
    function allowance(address _owner, address _spender) public constant returns(uint256);
    function approve(address _spender, uint256 _value) public returns(bool);
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    // Balances for each account
    mapping(address => uint256) balances;

    // Returns the token balance for account
    function balanceOf(address _address) public constant returns (uint256 balance) {
        return balances[_address];
    }

    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        Transfer(msg.sender, _to, _value);

        return true;
    }
}

contract StandardToken is BasicToken, ERC20 {
    // Owner of account approves the transfer of an amount to another account
    mapping (address => mapping (address => uint256)) allowed;

    // Returns the amount of tokens approved by the owner that can be transferred to the spender's account
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    // Token owner can approve for spender to transfer tokens from the token owner's account
    function approve(address _spender, uint256 _value) public returns(bool success) {
        require(
            allowed[msg.sender][_spender] == 0 &&
            _value > 0
        );

        allowed[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

        return true;
    }

    // Transfer tokens from one account to another account
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        balances[_from] = balances[_from].sub(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);

        Transfer(_from, _to, _value);

        return true;
    }
}

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
    uint256   public startDate;

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

    modifier CheckStartDate() {
        require(block.timestamp >= startDate);

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
        startDate = block.timestamp;
    }

    /**
     * @dev Fallback function that validates:
     * - if campaing reached hard cap or time expired
     * - if conditions are met
     */
    function () public IsCampaignEnded CheckStartDate CheckValidAddressDestination(msg.sender) payable {
        require(msg.value > 0);

        uint256 availableEthers = getAvailableEthers();

        require(msg.value <= availableEthers);

        etherReceived += msg.value;

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

    // Sets campaing to ended and withdraw funds to beneficiary
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

            uint256 withdrawBalance = this.balance.div(10).mul(4);

            beneficiary.transfer(withdrawBalance);
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

    // Get current balance of contract
    function getBalance() public view returns(uint256) {
        return this.balance;
    }

    /**
     * @dev Check if donator already voteDown
     * @param _address Donator's address'
     */
    function checkIfVoted(address _address) public view returns(bool) {
        return voters[_address].hasVoted;
    }
}