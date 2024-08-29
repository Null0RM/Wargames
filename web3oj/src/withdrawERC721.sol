cast call $instance --rpc-url $SEPOLIA_RPC_URL "ownerOf(uint256)" 0 
>> 0xcc26b0fe6fdff6e1a05013d1b452b9fc51b8bf1f

cast to-check-sum-address 0xcc26b0fe6fdff6e1a05013d1b452b9fc51b8bf1f
>> 0xCc26b0Fe6fdfF6e1A05013D1b452B9fC51b8Bf1F

cast send $instance --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY "transferFrom(address from, address to, uint256 tokenId)" 0xCc26b0Fe6fdfF6e1A05013D1b452B9fC51b8Bf1F $USER_ADDR 0
>> 성공