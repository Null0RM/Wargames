from Crypto.Hash import keccak

hash_obj = keccak.new(digest_bits=256)
hash_obj.update(b'0')
print(hash_obj.hexdigest())
