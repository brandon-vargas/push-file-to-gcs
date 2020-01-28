# Tool to push a file to Google Cloud Storage

A bash script that will push a file into a gcs bucket using a service account.

## Directions:
1. Pull the image from dockerhub
```
docker pull brandonlv/push-file-to-gcs
```

2. Set the required environment variables. 
```
export $PATH_TO_CREDS_FILE=<absolute path to SERVICE_ACCOUNT.json file>
export $PATH_TO_DESIRED_FILE=<absolute path to desired file to push>
export $GCS_BUCKET_NAME=<google cloud storage bucket name>
```

3. Run the image
```
docker run -it --rm -v $PATH_TO_CREDS_FILE:/service_account_creds.json -v $PATH_TO_DESIRED_FILE:/file.txt -e GCS_BUCKET_NAME=$GCS_BUCKET_NAME -e GOOGLE_APPLICATION_CREDENTIALS="/service_account_creds.json" -e FILE="/file.txt" brandonlv/push-file-to-gcs
```

# Notes
• This is a simplified version of "thestevenbell" 's pg_dump-to-google_gcs tool
