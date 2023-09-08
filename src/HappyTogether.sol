// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠛⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⣰⠟⠋⠁⠀⢸⡇⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠹⣦⣀⣀⣀⣀⡇⠀⠀⢰⠋⠉⢻⠶⢦⡄⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⢸⡆⠀⠀⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⣀⣤⠶⠋⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣆⡀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⣠⠞⠛⠉⠀⠈⠙⢧⡀⠀⠀⠀⠀⢀⣠⠴⠶⠶⠶⣤⡀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⢀⡏⣀⣠⡴⠶⣆⠀⣈⣧⠀⠀⠀⢰⠏⠁⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀
 *          ⠀⠀⠀⠀⣟⠛⠁⠀⠀⠀⠈⠛⠙⠛⡇⠀⠀⡟⢀⣠⣤⣤⠾⢷⣄⠀⣧⠀⠀⠀
 *          ⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⡇⢸⡇⠀⠀⠀⠀⢸⡇⢻⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠈⠻⣄⡀⠀⣀⣴⠟⠀⠀⠀⠀⣧⣸⣇⠀⠀⠀⠀⣼⢃⣸⡇⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⢸⡏⠉⠉⣿⡀⠀⠀⠀⠀⠉⠉⠙⡷⠦⠴⣾⠉⠉⠉⠁⠀⠀
 *          ⠀⠀⠀⠀⠀⣀⡴⠞⠛⠒⠚⠋⠉⠛⠶⣤⣀⠀⣠⡴⠳⠶⠶⠛⠶⣄⡀⠀⠀⠀
 *          ⠀⠀⣀⡴⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠟⠁⠀⠀⠀⠀⠀⠀⠈⠙⢶⡄⠀
 *          ⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀
 *          ⢀⡟⠀⠀⢰⡆⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆
 *          ⢸⠇⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⣶⠀⠀⣧
 *          ⣼⣀⣀⣀⣸⣇⣀⣀⣀⣀⣀⣀⣀⣸⣃⣀⣀⣸⣀⣀⣀⣀⣀⣀⣀⣀⣿⣀⣀⣸
 * @title HappyTogether
 * @dev This is a wedding gift contract. The prupose is to
 *  approximately record the wedding date & to give something
 *  funny to the newlyweds
 */

contract HappyTogether {
    // Keep as constants as they should be!
    address constant BRIDE = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // FILL YOUR OWN
    address constant GROOM = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; // FILL YOUR OWN
    address constant HOME = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;

    // To use forever after
    struct Family {
        address wife;
        address husband;
    }

    // Initiate struct
    Family family;

    // Let everyone know what they've promised
    event ShePromised(string what);
    event HePromised(string what);

    // Gift unwrapping
    event GiftGiven(string greeting, string from, uint256 amount);
    event GiftUnwrapped();

    /**
     *  @dev function for sending gifts
     */
    function sendGift(string calldata _greeting, string calldata _from) external payable {
        emit GiftGiven(_greeting, _from, msg.value);
    }

    /**
     *  @dev super important function for calling out a promise
     *  @param _what string is the made promise
     */
    function iPromise(string calldata _what) external payable {
        if (msg.sender == BRIDE && family.wife != BRIDE) {
            family.wife = BRIDE;
            emit ShePromised(_what);
        } else if (msg.sender == GROOM && family.husband != GROOM) {
            family.husband = GROOM;
            emit HePromised(_what);
        }

        if (family.wife == BRIDE && family.husband == GROOM) {
            payable(HOME).transfer(address(this).balance);
            emit GiftUnwrapped();
        }
    }
}
