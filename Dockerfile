FROM python:3-alpine

RUN mkdir -p /zulip-archive && apk update && apk add git curl

COPY . /zulip-archive-action/

ENTRYPOINT ["sh", "/zulip-archive-action/entrypoint.sh"]

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
python3 get-pip.py && \
pip3 install zulip==0.6.3 && \
pip3 install pyyaml==5.2 && \
pip3 install crudini
