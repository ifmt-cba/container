from minio import Minio
from minio.error import S3Error
import os
import sys

# MinIO connection details
MINIO_ENDPOINT = os.environ.get('MINIO_ENDPOINT') #"minio:9000"
MINIO_ACCESS_KEY = os.environ.get('MINIO_ACCESS_KEY') #"minioadmin"
MINIO_SECRET_KEY = os.environ.get('MINIO_SECRET_KEY') #"minioadmin"
MINIO_SECURE = False # Set to True if using HTTPS

# Bucket and object details
BUCKET_NAME = "my-test-bucket"
FILE_TO_UPLOAD = sys.argv[1]
OBJECT_NAME = "uploaded_file.txt"

def main():
    # Create a MinIO client
    client = Minio(
        MINIO_ENDPOINT,
        access_key=MINIO_ACCESS_KEY,
        secret_key=MINIO_SECRET_KEY,
        secure=MINIO_SECURE
    )

    # Make the bucket if it doesn't exist
    try:
        if not client.bucket_exists(BUCKET_NAME):
            client.make_bucket(BUCKET_NAME)
            print(f"Bucket '{BUCKET_NAME}' created successfully.")
    except S3Error as err:
        print(f"Error creating bucket: {err}")
        return

    # Create a dummy file for upload
    with open(FILE_TO_UPLOAD, "a") as f:
        f.write("This is a test file for MinIO upload.")

    # Upload the file
    try:
        client.fput_object(
            BUCKET_NAME,
            OBJECT_NAME,
            FILE_TO_UPLOAD,
        )
        print(f"'{FILE_TO_UPLOAD}' uploaded as '{OBJECT_NAME}' to bucket '{BUCKET_NAME}'.")
    except S3Error as err:
        print(f"Error uploading file: {err}")
    finally:
        # Clean up the dummy file
        if os.path.exists(FILE_TO_UPLOAD):
            os.remove(FILE_TO_UPLOAD)

if __name__ == "__main__":
    main()
