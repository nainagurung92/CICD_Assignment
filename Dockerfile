FROM python:3.11.9

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

# Create data directory
RUN mkdir ./data

# Copy data files
COPY data/test.csv ./data/test.csv
COPY data/train.csv ./data/train.csv

# Copy scripts
COPY train.py .
COPY test.py .

RUN python3 train.py

CMD ["python3", "test.py"]




