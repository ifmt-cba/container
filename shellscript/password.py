# Python 3 code to demonstrate the
# generate of hash (string - hexadecimal)
import hashlib
import bcrypt
import sys

# initializing password from command line
str2hash = sys.argv[1]

# encode password(Converts the string into bytes to be acceptable by hash function)
# then send to md5()
md5 = hashlib.md5(str2hash.encode())
sha = hashlib.sha512(str2hash.encode())
# printing the equivalent hexadecimal value.
print(f'MD5: {md5.hexdigest()}')
print(f'SHA (512): {sha.hexdigest()}')
#pip install py-bcrypt
#bcrypt is designed to be slow. bcrypt also has an option to 
#adjust how slow (salt) you want it to be when generating the hashed
#password for the first time:
#print(f'CRYPT: {bcrypt.hashpw(str2hash, bcrypt.gensalt( 14 ))}')
