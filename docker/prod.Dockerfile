FROM python:3
EXPOSE 5000
WORKDIR /app

COPY . /app

RUN pip install -r config/requirements.txt && \
    pip install uwsgi

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -b && \
    apt-get install -y nodejs

RUN npm install && npm run build
CMD ["uwsgi", "--ini", "/app/docker/config/uwsgi.ini"]

RUN adduser --uid 431 --disabled-password --disabled-login --gecos 'webcompat' --no-create-home webcompat
RUN chown webcompat.webcompat -R .
USER webcompat