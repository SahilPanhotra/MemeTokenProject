// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract RHINO is ERC20, Ownable, ERC20Burnable {
    event tokensBurned(address indexed owner, uint256 amount, string message);
    event tokensMinted(address indexed owner, uint256 amount, string message);
    event additionalTokensMinted(address indexed owner,uint256 amount,string message);

    constructor() ERC20("RHINO", "RHN") {
        _mint(msg.sender, 1000 * 10**decimals());
        emit tokensMinted(msg.sender, 1000 * 10**decimals(), "Initial supply of tokens minted.");
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount *10**18);
        emit additionalTokensMinted(msg.sender, amount *10**18, "Additional tokens minted.");
    }

    function burn(uint256 amount) public override onlyOwner {
        _burn(msg.sender, amount *10**18);
        emit tokensBurned(msg.sender, amount *10**18, "Tokens burned.");
    }
}