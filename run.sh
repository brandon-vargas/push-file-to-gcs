#!/bin/sh

#> gsutil to send a file to Google Cloud Storage 

SERVICE_ACCOUNT_CLIENT_EMAIL=$(cat $GOOGLE_APPLICATION_CREDENTIALS | jq -r  '.client_email') 

# echo checking to ensure that GCLOUD authentication has been enabled.
gcloud auth list | grep $SERVICE_ACCOUNT_CLIENT_EMAIL
if [[ $? != 0 ]]; then
    echo GCLOUD auth was not enabled.
    echo GCLOUD auth activate-service-account started.

    gcloud auth activate-service-account $SERVICE_ACCOUNT_CLIENT_EMAIL --key-file=$GOOGLE_APPLICATION_CREDENTIALS

    if [[ $? != 0 ]]; then 
        echo GCLOUD auth activate-service-account failed. Exiting. 
        rm $FILE
        exit $?; 
    fi
else 
    echo GCLOUD authentication is enabled.
fi


echo starting gsutil cp $FILE gs://${GCS_BUCKET_NAME}

gsutil cp $FILE gs://${GCS_BUCKET_NAME}

if [[ $? != 0 ]]; then 
    echo gsutil cp $FILE gs://${GCS_BUCKET_NAME} failed. Exiting.
    rm $FILE
    exit $?; 
fi

echo Checking the contents of the bucket to ensure that the backup was uploaded.

gsutil ls gs://${GCS_BUCKET_NAME} | grep $FILE

if [[ $? != 0 ]]; then 
    echo The backup was not found in the bucket. Exiting. 
    exit $?; 
fi

echo Success! The backup file was uploaded. Exiting.  

exit 0;