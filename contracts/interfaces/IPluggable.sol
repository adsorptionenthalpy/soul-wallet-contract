// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

interface IPluggable {
    function walletInit(bytes calldata data) external;
    function walletDeInit() external;
}