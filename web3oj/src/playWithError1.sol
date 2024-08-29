cast send 0xF8E07835C94aC985821d45B0a468679790035683 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "throwError()"
>> server returned an error response: error code 3: execution reverted: No error message found.

cast send 0xF8E07835C94aC985821d45B0a468679790035683 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "setErrorMessage(string)" "No error message found."