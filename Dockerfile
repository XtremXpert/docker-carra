FROM python:3.5 

ENV PYTHONUNBUFFERED 1
ENV APP_USER='carra' \
	ADMIN_PASS='nimda' \
	APP_ROOT='/src' \
	DB_USER='carra_user' \
	DB_PASS='carra_pass' \
	DB_PORT=5432 \
	DB_HOST='db'

COPY src ${APP_ROOT}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/* \

#-- User and APP_ROOT creation
	&& groupadd -r ${APP_USER} \
	&& useradd -r -m -d ${APP_ROOT} -s /usr/sbin/nologin -g ${APP_USER} ${APP_USER} \

#--- app env
	&& pip install -r /src/requirements.txt \
	&& pip install -r /src/requirements-all.txt \

#--- Add su-exec to switch to user at run time only
	&& cd /tmp \
	&& git clone https://github.com/ncopa/su-exec \
	&& cd su-exec \
	&& make \
	&& mv su-exec /usr/bin/ \

#-- User = $APP_USER
	&& chown -R ${APP_USER}:${APP_USER} ${APP_ROOT}
	
WORKDIR ${APP_ROOT}
#USER ${APP_USER}

EXPOSE 8000
#VOLUME ["/db.sqlite3"]

# moved to docker-compose
ENTRYPOINT ["/src/entrypoint.sh"]<
