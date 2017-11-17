"""
Two things are wrong with Django's default `SECRET_KEY` system:
1. It is not random but pseudo-random
2. It saves and displays the SECRET_KEY in `settings.py`
This snippet
1. uses `SystemRandom()` instead to generate a random key
2. saves a local `secret.txt`
The result is a random and safely hidden `SECRET_KEY`.
"""
import os
import sys
import random
from pathlib import Path

SECRET_FILE = sys.argv[1]
print ("Looking for secret key in :" + SECRET_FILE)
my_file = Path(SECRET_FILE)
SECRET_KEY = ''.join([random.SystemRandom().choice('abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)') for i in range(50)])
secret = open(SECRET_FILE, 'w')
secret.write(SECRET_KEY)
secret.close()
print ("Loading " + SECRET_KEY)