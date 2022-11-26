// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract ERC20 {

    mapping(address => uint) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;
    
    uint private _totalSupply;
    string private _name; // ETHEREUM
    string private _symbol; // ETH
    uint8 private _decimals;
    address public owner;
    mapping (address=>bool) private _blackList;

    modifier checkBlackList() {
        require(!_blackList[msg.sender], "");
        _;
    }

    modifier checkBalance(uint256 amount) {
        require(_balances[msg.sender] > amount, "Not Sufficient Balance");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed from, address indexed to, uint amount);



    constructor(string memory name, string memory symbol, uint8 decimals) {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _totalSupply = 100000 * (10 ** 18);
        owner = msg.sender;
    }


    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    //  _balnaces 를 업데이트 
    function transfer(address to, uint256 amount) public checkBalance(amount) checkBlackList returns (bool) {
        
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public checkBalance(amount) checkBlackList returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);

        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public checkBlackList returns (bool) {
        require(_balances[from] > amount, "Not Sufficient Balance");
        require(_allowances[from][to] > amount, "Not Sufficient Balance");
        require(to == msg.sender, "Not Allowed User");

        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function mint(address to, uint amount) public {
        _balances[to] += amount;
        _totalSupply += amount;
    }

    function burnByUser(uint amount) public {
        transfer(address(0), amount);
        _totalSupply -= amount;
    }

    function setBlackList(address to) public onlyOwner {
        _blackList[to] = true;
    }

 }