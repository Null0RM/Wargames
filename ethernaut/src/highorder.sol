$ cast send 0xE03032F6d8bEBe6459A4B5e49D2Fef5d4aCD440a --rpc-url $SEPOLIA_RPC_URL --private-key $UPSIDE_SK 0x211c85ab0000000000000000000000000000000000000000000000000000000000000100

$ cast send 0xE03032F6d8bEBe6459A4B5e49D2Fef5d4aCD440a --rpc-url $SEPOLIA_RPC_URL --private-key $UPSIDE_SK "claimLeadership()"

$ cast call --rpc-url $SEPOLIA_RPC_URL 0xE03032F6d8bEBe6459A4B5e49D2Fef5d4aCD440a "commander()"
>> 0x000000000000000000000000e9c6bb1b3da49415a788d005b9a4fef9f5f19ea3

