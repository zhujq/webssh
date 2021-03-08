FROM fnndsc/ubuntu-python3:20.04
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "run.py"]
