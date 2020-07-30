FROM python:3.8-alpine as base

FROM base as poetry
RUN apk --update --upgrade add curl \
    gcc \
    ttf-dejavu \
    python3-dev \
    musl-dev \
    jpeg-dev \
    zlib-dev \
    libffi-dev \
    cairo-dev \
    pango-dev \
    openssl-dev \
    git \
    fontconfig \
    ca-certificates \
    py3-lxml \
    gdk-pixbuf
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
RUN ln -s $HOME/.poetry/bin/poetry /usr/local/bin

FROM poetry as install_deps
WORKDIR /app
COPY poetry.lock pyproject.toml /app/
RUN poetry install

FROM install_deps as run_app
COPY . .
ENTRYPOINT ["poetry", "run"]