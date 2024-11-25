//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {NaivePaymaster} from  "../src/NaivePaymaster.sol";

import {IEntryPoint} from "account-abstraction/core/BasePaymaster.sol";


contract DeployAndFundPaymaster is Script {
    function run() public {
        vm.broadcast();
        NaivePaymaster paymaster = new NaivePaymaster(IEntryPoint(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789), msg.sender);

        vm.broadcast(msg.sender);
        paymaster.deposit{value: 0.1 ether}();
    }
}