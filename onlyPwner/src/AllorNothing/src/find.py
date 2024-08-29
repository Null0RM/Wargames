from web3 import Web3
import json

rpc_url = 'https://nodes.onlypwner.xyz/rpc/07d04c82-04d1-4aee-b184-c77068e6f2f8' 
w3 = Web3(Web3.HTTPProvider(rpc_url))
assert w3.is_connected()

for block_number in range(100):
    block = w3.eth.get_block(block_number, full_transactions=True)
    for tx in block.transactions:
        receipt = w3.eth.get_transaction_receipt(tx['hash'])
        print()
        print(tx['hash'].hex())
        print(receipt)
