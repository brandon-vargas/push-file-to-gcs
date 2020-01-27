# Tool to push a file to Google Cloud Storage

Usage: 
```docker pull brandonlv/push-file-to-gcs```
```docker run -it --rm -v $PATH_TO_CREDS_FILE:/service_account_creds.json -v $PATH_TO_DESIRED_FILE:/file.txt -e GCS_BUCKET_NAME=$GCS_BUCKET_NAME -e GOOGLE_APPLICATION_CREDENTIALS="/service_account_creds.json" -e FILE="/file.txt" brandonlv/push-file-to-gcs```
