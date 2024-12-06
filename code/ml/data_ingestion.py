from os import environ

from boto3 import client


s3_endpoint_url = environ.get('S3_ENDPOINT')
s3_access_key = environ.get('S3_ACCESS_KEY_ID')
s3_secret_key = environ.get('S3_SECRET_ACCESS_KEY')
s3_bucket_name = environ.get('S3_BUCKET')


print(f'Downloading data "raw-data.csv" '
      f'from bucket "{s3_bucket_name}" '
      f'from S3 storage at {s3_endpoint_url}')

s3_client = client(
    's3', endpoint_url=s3_endpoint_url,
    aws_access_key_id=s3_access_key, aws_secret_access_key=s3_secret_key
)

s3_client.download_file(
    s3_bucket_name,
    'data/raw-data.csv',
    'raw_data.csv'
)