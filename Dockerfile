FROM python:3.10.5-slim
RUN apt-get update -y && apt-get install build-essential curl vim -y
#timezone
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone
ENV PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PYTHONUNBUFFERED=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_HOME=$HOME/.poetry 
ENV PATH="$POETRY_HOME/bin:$PATH"
EXPOSE 8000
WORKDIR /workspace
RUN pip install --upgrade pip
RUN curl -sSL https://install.python-poetry.org | python3 -
COPY . .
RUN poetry install
CMD ["/bin/bash","scripts/start-dev.sh"]