pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "@arbitrum/nitro-contracts/src/libraries/AddressAliasHelper.sol";

contract ArbitrumInboxMock is Test {
    function createRetryableTicket(
        address to,
        uint256 l2CallValue,
        uint256 maxSubmissionCost,
        address excessFeeRefundAddress,
        address callValueRefundAddress,
        uint256 gasLimit,
        uint256 maxFeePerGas,
        bytes calldata data
    ) public payable returns (uint256 _msgNum) {
        // modify to call l2 contract directly
        address l2Alias = AddressAliasHelper.applyL1ToL2Alias(address(msg.sender));
        vm.deal(l2Alias, 100 ether);
        vm.startPrank(l2Alias);
        (bool success,) = to.call(data);
        vm.stopPrank();
        require(success, "call failed");
    }
}
