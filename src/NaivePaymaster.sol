// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

/* solhint-disable reason-string */
/* solhint-disable no-inline-assembly */

import "account-abstraction/core/BasePaymaster.sol";


contract NaivePaymaster is BasePaymaster {
    using UserOperationLib for UserOperation;

    event PaymasterPaid(uint requiredPreFund);

    constructor(IEntryPoint _entryPoint, address initialOwner) BasePaymaster(_entryPoint) Ownable(initialOwner) {}


    function _validatePaymasterUserOp(
        UserOperation calldata userOp,
        bytes32 /*userOpHash*/,
        uint256 requiredPreFund
    ) internal override returns (bytes memory context, uint256 validationData) {
        (requiredPreFund);
        (userOp);

        emit PaymasterPaid(requiredPreFund);
        return (
            "",
            _packValidationData(
                false,
                uint48(block.timestamp + 3000),
                uint48(block.timestamp - 300)
            )
        );
    }
}
