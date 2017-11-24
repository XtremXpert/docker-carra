import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db', 'db.sqlite3'),
    }
}

# https://docs.djangoproject.com/en/1.8/ref/settings/#engine

# ========================= postgresql
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql_psycopg2',
#         'NAME': 'mydatabase',
#         'USER': 'mydatabaseuser',
#         'PASSWORD': 'mypassword',
#         'HOST': '127.0.0.1',
#         'PORT': '5432',
#     }
# }

# ========================= mysql
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'mydatabase',
#         'USER': 'mydatabaseuser',
#         'PASSWORD': 'mypassword',
#         'HOST': '127.0.0.1',
#         'PORT': '5432',
#     }
# }


DEBUG = True



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
