import requests

# Sepolia Etherscan API 키와 주소 설정
API_KEY = 'B7W9SHUJNST9Z8JJSRSKCUXWUZD1MSJZ73'
ADDRESS = '0x0BF03789de928b0f8464AC66302000B05CD51b65'

def get_transactions(api_key, address, start_block=0, end_block='latest'):
    url = 'https://api-sepolia.etherscan.io/api'
    params = {
        'module': 'account',
        'action': 'txlist',
        'address': address,
        'startblock': start_block,
        'endblock': end_block,
        'sort': 'asc',  # 'asc' for ascending, 'desc' for descending
        'apikey': api_key
    }
    
    response = requests.get(url, params=params)
    data = response.json()
    
    if data['status'] == '1':
        return data['result']
    else:
        raise Exception(f"Error fetching transactions: {data['message']}")

def filter_contract_creations(transactions):
    contract_creations = [tx for tx in transactions if tx['contractAddress'] != '']
    return contract_creations

def main():
    try:
        transactions = get_transactions(API_KEY, ADDRESS)
        contract_creations = filter_contract_creations(transactions)
        
        if not contract_creations:
            print("No contract creation transactions found.")
        else:
            for tx in contract_creations:
                print(f"Hash: {tx['hash']}")
                print(f"Block Number: {tx['blockNumber']}")
                print(f"From: {tx['from']}")
                print(f"To: {tx['to']}")
                print(f"Value: {tx['value']} wei")
                print(f"Gas Used: {tx['gasUsed']}")
                print(f"Gas Price: {tx['gasPrice']}")
                print(f"Timestamp: {tx['timeStamp']}")
                print(f"contractAddress: {tx['contractAddress']}")
                print("-" * 60)
    except Exception as e:
        print(e)

if __name__ == "__main__":
    main()
