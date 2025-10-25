FROM python:3.14.0
ENV MINIO_ENDPOINT=minio:9000
ENV MINIO_ACCESS_KEY=minioadmin
ENV MINIO_SECRET_KEY=minioadmin
RUN pip install minio
COPY upload.py /
COPY test_file.txt /
ENTRYPOINT ["python","upload.py"]
CMD [""]
