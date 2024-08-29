// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    bytes32 private just_bytes32 = hex"abcdabcdabcdabcd";
    
    bytes private short_bytes = hex"1234123412341234";
    bytes private  long_bytes = hex"1234567890abcdeffedcba09876543211234567890abcdeffedcba09876543211234567890abcdeffedcba09876543211234567890abcdeffedcba09876543211234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321";   
    
    string private short_string = "hello world";
    string private long_string = "flag{aaaaaaaaaaaaaabbbbbbbbbbbbbbbbbccccccccccccasdfadfjlhads;lfjhasfhaslfjkhsdkjfasdhlkckadscaldjnvbaksfvdsfdvslasdsalkskljafjklsfjskljshjkflfjlklnfksfnasdfn}";

    mapping(uint256 => string) private uint_to_short_string;
    mapping(uint256 => string) private uint_to_long_string;
    mapping(string => string) private string_to_short_string;
    mapping(string => string) private string_to_long_string;
    mapping(string => mapping(string => string)) private string_to_string_to_string;
}
