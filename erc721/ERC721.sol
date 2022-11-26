// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;


contract ERC721 {

    string private _name;
    string private _symbol;

    mapping(uint256 => string) private _tokenInfo;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    // 토큰 추가적인 권한정보 
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    uint private totalSupply;

    event Transfer(address from, address to, uint tokenId);
    event Approval(address from, address to, uint tokenId);
    // 교환이 OpenSea 에서 토큰 옮기는 권한이 필요하므로 
    event ApprovalForAll(address from, address operator, bool approval);

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address owner) public view returns (uint256) {

    }

    function ownerOf(uint256 tokenId) public view returns (address) {

    }

    function name() public view returns (string memory) {

    }

    function symbol() public view returns (string memory) {

    }

    // 토큰의 실제 이미지가 어디에있는지 url 
    function tokenURI(uint256 tokenId) public view returns (string memory) {

    }

    // 어떤주소의 토큰의 이동권한을 줬는지 
    function getApproved(uint256 tokenId) public view returns (address) {

    }

    function isApproved(uint256 tokenId) public view returns (address) {

    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {

    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public {

    }

    function mint(address to, uint256 tokenId, string memory url) public {
        _balances[to] += 1;
        _owners[tokenId] = to;
        _tokenInfo[tokenId] = url;
        totalSupply += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function burn(uint256 tokenId) public {
        address owner = _owners[tokenId];
        delete _tokenApprovals[tokenId];

        _balances[owner] -= 1;
        delete _owners[tokenId];
        
        emit Transfer(owner, address(0), tokenId);
    }

    function transfer(
        address to,
        uint256 tokenId
    ) public {

    }

    function approve(address to, uint256 tokenId) public {

    }

    // 거래소에 이동권한을 전부 주는것 
    function setApprovalForAll(
        address owner,
        address operator,
        bool approved
    ) public {

    }

}