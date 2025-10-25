FROM python:3.14.0
RUN pip install minio
COPY upload.py /
COPY test_file.txt /
ENTRYPOINT ["python","upload.py"]
CMD [""]
