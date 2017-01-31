FROM python:3.5
ENV PYTHONUNBUFFERED 1

ENV APP_USER carra
ENV APP_ROOT /src

#---  User creation 
RUN groupadd -r ${APP_USER} 
RUN useradd -r -m -d ${APP_ROOT} -s /usr/sbin/nologin -g ${APP_USER} ${APP_USER} 

#---  Config as root 
RUN mkdir /config
COPY config /config
COPY src /src


# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#         postgresql-client \
#     && rm -rf /var/lib/apt/lists/*

RUN pip install -r /src/requirements.txt


#-- Copy as User = $APP_USER  
RUN chown -R ${APP_USER}:${APP_USER} /src
WORKDIR ${APP_ROOT}
USER ${APP_USER}
