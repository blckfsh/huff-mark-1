// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleStorageTest is Test {
    /// @dev Address of the SimpleStorage contract.
    SimpleStorage public simpleStorage;

    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStorage = SimpleStorage(HuffDeployer.deploy("SimpleStorage"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        simpleStorage.setValue(value);
        console.log(value);
        console.log(simpleStorage.getValue());
        assertEq(value, simpleStorage.getValue());
    }
}

interface SimpleStorage {
    function setValue(uint256) external;
    function getValue() external returns (uint256);
}
