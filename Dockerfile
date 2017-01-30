FROM python:3.5
ENV PYTHONUNBUFFERED 1

#ENV C_FORCE_ROOT true

ENV APP_USER myapp
ENV APP_ROOT /src

#RUN mkdir /src;

RUN groupadd -r ${APP_USER} 
RUN useradd -r -m -d ${APP_ROOT} -s /usr/sbin/nologin -g ${APP_USER} ${APP_USER} 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${APP_ROOT}

RUN mkdir /config
ADD config/requirements.pip /config/

RUN pip install -r /config/requirements.pip

USER ${APP_USER}
ADD . ${APP_ROOT}

