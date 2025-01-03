library(aws.s3)


#Get environment variables to use for the connection
s3_endpoint_url <- Sys.getenv("S3_ENDPOINT")
s3_access_key <- Sys.getenv("S3_ACCESS_KEY_ID")
s3_secret_key <- Sys.getenv("S3_SECRET_ACCESS_KEY")
s3_bucket_name <- Sys.getenv("S3_BUCKET")

print(s3_endpoint_url)
#remove either HTTPS or HTTP since it doesnt want it in the URL. Obey the R-gods.
s3_endpoint_url <- sub(paste0("^", "http://"), "", s3_endpoint_url)

Sys.setenv("AWS_ACCESS_KEY_ID"=s3_access_key,
           "AWS_SECRET_ACCESS_KEY"=s3_secret_key,
           "AWS_S3_ENDPOINT"=s3_endpoint_url,
           "AWS_DEFAULT_REGION"="")

save_object("data/raw-data.csv", file = "raw_data.csv", bucket = s3_bucket_name, region ="", use_https = FALSE)

print("Download complete, LETS GO!")
