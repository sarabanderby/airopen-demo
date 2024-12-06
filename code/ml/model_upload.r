library(aws.s3)

s3_endpoint_url <- Sys.getenv('S3_ENDPOINT')
s3_bucket <- Sys.getenv('S3_BUCKET')
s3_access_key <- Sys.getenv('S3_ACCESS_KEY_ID')
s3_secret_key <- Sys.getenv('S3_SECRET_ACCESS_KEY')

s3_endpoint_url <- sub(paste0("^", "https://"), "", s3_endpoint_url)
s3_endpoint_url <- sub(paste0("^", "http://"), "", s3_endpoint_url)

# Format the time as a string suitable for filenames
current_time <- Sys.time()
timestamp <- format(current_time, "%Y%m%d_%H%M%S")

# Create the filename using the formatted timestamp

object_name <- paste0("models/model_", timestamp, ".bst")
print('Uploading model to: ')
print(object_name)

put_object(file = "model.bst", object = object_name, base_url = s3_endpoint_url, use_https = FALSE, bucket = s3_bucket, region = "", key = s3_access_key, secret = s3_secret_key)

print('Model upload complete')