// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";

/**
 * CeloHTGovernor
 * - Voting uses an IVotes token (could be wrapped CELO voting token or governance token if added later).
 * - Quorum fraction passed in constructor (2% recommended).
 */
contract CeloHTGovernor is
    Governor,
    GovernorCountingSimple,
    GovernorVotes,
    GovernorVotesQuorumFraction,
    GovernorTimelockControl
{
    constructor(IVotes _token, TimelockController _timelock)
        Governor("CeloHT Governor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(2) // 2% quorum
        GovernorTimelockControl(_timelock)
    {}

    // The following functions are overrides required by Solidity.

    function votingDelay() public pure override returns (uint256) {
        return 1; // ~ 1 block (configurable)
    }

    function votingPeriod() public pure override returns (uint256) {
        return 45818; // ~7 days in blocks on chains with ~15s blocks; adjust for Celo as needed
    }

    function proposalThreshold() public pure override returns (uint256) {
        return 0; // no minimum tokens to propose by default
    }

    // The functions below are overrides required by Solidity for multiple inheritance.

    function _execute(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl) {
        super._execute(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(Governor, GovernorTimelockControl) returns (uint256) {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function _executor() internal view override(Governor, GovernorTimelockControl) returns (address) {
        return super._executor();
    }

    // The following functions are required to make the compiler happy (hooks from Governor)
    function supportsInterface(bytes4 interfaceId) public view override(Governor, GovernorTimelockControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}