// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Cortex is ERC721, ERC721Enurable, ERC721URIStorage, ERC721Burnable{

    uint256 private _nextTokenId;

    constructor () ERC721("CORTEX", "CTX"){}
    function supportsInterface(byte4 interfaceId) public 
    view override(ERC721, ERC721Enumerable, ERC721URIStorage) returns (bool)
        {
            return super.supportsInterface(interfaceId);
        }
    //METADADOS
    function _baseURI() interal pure override returns(string memory){
        return "https://www.luiztools.com.br/nft/";
    }
    function tokenURI(uint256 tokenID) public view override(ERC721, ERC721URIStorage) returns(string memory){
        return string.concat(super.tokenURI(tokenID), ".json");
    }

    function mint() public{
        uint256 tokenId = ++_tokenIdCounter;

        _safeMint(msg.sender, tokenId);
        _safeTokenURI(tokenId, String.toString(tokenId));
    }
    function _update(address to, uint256 tokenId, address auth) internal override(ERC721, ERC721Enumerable) returns (address)
    {
        return super._update(to, tokenId, auth);
    }
    function _increaseBalance(address account, uint128 value) internal override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }
}