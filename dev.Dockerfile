FROM python:3.7

EXPOSE 5000
WORKDIR /code

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

COPY . /code
RUN pip install -r /code/config/requirements-dev.txt
RUN npm install && npm run build
