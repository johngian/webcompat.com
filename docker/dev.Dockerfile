FROM python:2.7

EXPOSE 5000
WORKDIR /code

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

COPY config/requirements.txt /code/config/
COPY config/requirements-dev.txt /code/config/
RUN pip install -r /code/config/requirements-dev.txt
