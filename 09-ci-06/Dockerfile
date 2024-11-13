FROM python:slim

RUN pip install flask flask-jsonpify flask-restful
RUN mkdir /python-api
COPY python-api.py /python-api

ENTRYPOINT [ "python" , "/python-api/python-api.py" ]
