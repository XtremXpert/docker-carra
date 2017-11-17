import os
from pathlib import Path
import random

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': os.environ['DB_NAME'],
        'USER': os.environ['DB_USER'],
        'PASSWORD': os.environ['DB_PASS'],
        'HOST': os.environ['DB_HOST'],
        'PORT': os.environ['DB_PORT']    
    }
}

SECRET_FILE = BASE_DIR + "/secret_key.txt"
 
print ("Looking for secret key in :" + SECRET_FILE)
my_file = Path(SECRET_FILE)
secret = open(SECRET_FILE, 'r')
SECRET_KEY = secret.read()
secret.close()

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True if os.getenv('DEBUG') == 'true' else False
ALLOWED_HOSTS = ['*']

# add email settings
HOST_DOMAIN = '127.0.0.1:8000'

EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'certae.sm@gmail.com'
EMAIL_HOST_PASSWORD = 'dariogomezt'
DEFAULT_FROM_EMAIL = 'certae.sm@gmail.com'

# used for debug
# EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'


# FIXTURE_DIRS = ( os.path.join(BASE_DIR, 'fixtures'),  )
