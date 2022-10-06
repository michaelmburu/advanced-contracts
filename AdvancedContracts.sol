// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

// Create an integer state variable called data that cannot be used internally and not by any other contract - private
// Create an integer state variable called info that cannot be used both inside an outside the contract - public
// Immediately initialize info' value to 10 - constructor
// Initialize a function called increment which can only be use internally - private, takes a uint and be readonly returning a + 1
// Write a function called update data, which takes an integer argument
contract C {
    uint256 private data;
    uint256 public info;

    constructor() {
        info = 10;
    }

    //Can only be called internally
    function increment(uint256 a) private pure returns (uint256) {
        return a + 1;
    }

    // Can be caled from outside the contract
    function getData() public view returns (uint256) {
        return data;
    }

    // Can be called from outside the contract
    function updateData(uint256 a) public {
        data = a;
    }

    // Can only be called internally or by derived contracts
    function compute(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

// Grab contract C to a new variable c and set a new instance of the contract to it
// Write a read only function called readInfo which returns the info from contract C which can be called both inide and outside the contract
contract D {
    C c = new C();

    function readInfo() public view returns (uint256) {
        return c.info();
    }
}

// Inherit contract C into E
// Create a integer called result whihc can only be used internally and not by derived contracts
// Create a private variable called C to a new instance of the contract C upon deployment with a constructor
// Write a function called getComputedResult which sets the values of 23 and to the compute function in Contract C, can be called internally or externally
// Create a public readonly function called getResult which returns the var result
// Create a readonly function which returns the info variable from contract C and sets the functionto be used both externally and internally.
// Deploy the contract and test the result.

contract E is C {
    uint256 private result;
    C private c;

    constructor() {
        c = new C();
    }

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function getNewInfo() public view returns (uint256) {
        return c.info();
    }
}
