// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract GaslessToken is ERC20, EIP712 {
    using ECDSA for bytes32;

    bytes32 private constant _TRANSFER_TYPEHASH = 
        keccak256("MetaTransfer(address from,address to,uint256 amount,uint256 nonce)");

    mapping(address => uint256) public nonces;

    constructor() ERC20("GaslessToken", "GLT") EIP712("GaslessToken", "1") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function metaTransfer(
        address from,
        address to,
        uint256 amount,
        bytes memory signature
    ) public {
        bytes32 structHash = keccak256(
            abi.encode(_TRANSFER_TYPEHASH, from, to, amount, nonces[from])
        );

        bytes32 hash = _hashTypedDataV4(structHash);
        address signer = hash.recover(signature);

        require(signer == from, "Invalid signature");
        require(signer != address(0), "Invalid signer");

        nonces[from]++;
        _transfer(from, to, amount);
    }
}// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract GaslessToken is ERC20, EIP712 {
    using ECDSA for bytes32;

    bytes32 private constant _TRANSFER_TYPEHASH = 
        keccak256("MetaTransfer(address from,address to,uint256 amount,uint256 nonce)");

    mapping(address => uint256) public nonces;

    constructor() ERC20("GaslessToken", "GLT") EIP712("GaslessToken", "1") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function metaTransfer(
        address from,
        address to,
        uint256 amount,
        bytes memory signature
    ) public {
        bytes32 structHash = keccak256(
            abi.encode(_TRANSFER_TYPEHASH, from, to, amount, nonces[from])
        );

        bytes32 hash = _hashTypedDataV4(structHash);
        address signer = hash.recover(signature);

        require(signer == from, "Invalid signature");
        require(signer != address(0), "Invalid signer");

        nonces[from]++;
        _transfer(from, to, amount);
    }
}
