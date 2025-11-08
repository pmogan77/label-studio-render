#!/bin/bash
set -e

# -------------------------------
# AWS S3 storage configuration
# -------------------------------
export STORAGE_TYPE=s3
export STORAGE_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export STORAGE_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export STORAGE_AWS_REGION_NAME=$AWS_REGION
export STORAGE_AWS_BUCKET_NAME=$AWS_BUCKET
export STORAGE_AWS_FOLDER=$S3_INPUT_PATH
export STORAGE_AWS_ENDPOINT_URL=$AWS_ENDPOINT_URL

# -------------------------------
# Enable invite-only registration
# -------------------------------
export LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=false
export CSRF_TRUSTED_ORIGINS="https://label-studio-render-cxdy.onrender.com,http://localhost:8080,http://127.0.0.1:8080,http://0.0.0.0:8080"
export USE_ENFORCE_CSRF_CHECKS=false

# -------------------------------
# Start Label Studio
# -------------------------------
label-studio start --host https://label-studio-render-cxdy.onrender.com --port $PORT