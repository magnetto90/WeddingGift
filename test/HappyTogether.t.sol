// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test} from "forge-std/Test.sol";
import {HappyTogether} from "../src/HappyTogether.sol";

contract HappyTogetherTest is Test {
    HappyTogether public happyTogether;
    address constant BRIDE = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address constant GROOM = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address constant HOME = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address immutable uncleBob = makeAddr("uncleBob");

    function setUp() public {
        happyTogether = new HappyTogether();
        vm.deal(uncleBob, 1 ether);
        vm.startPrank(uncleBob);
        happyTogether.sendGift{value: 1 ether}("Congratulations!", "Uncle Bob");
    }

    function testWedding() public {
        vm.startPrank(BRIDE);
        happyTogether.iPromise("I do");
        vm.startPrank(GROOM);
        happyTogether.iPromise("I do");

        assertEq(address(happyTogether).balance, 0);
        assertEq(address(HOME).balance, 1 ether);
    }

    function testNonWedding() public {
        vm.startPrank(BRIDE);
        happyTogether.iPromise("I do");
        vm.startPrank(GROOM);
        happyTogether.iPromise("I do");

        assertEq(address(happyTogether).balance, 0);
        assertEq(address(HOME).balance, 1 ether);

        vm.deal(uncleBob, 1 ether);
        vm.startPrank(uncleBob);
        happyTogether.sendGift{value: 1 ether}("Congratulations!", "Uncle Bob");

        assertEq(address(happyTogether).balance, 1 ether);

        happyTogether.iPromise("I do");

        assertEq(address(happyTogether).balance, 0 ether);
        assertEq(address(HOME).balance, 2 ether);
    }
}
