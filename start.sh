#!/bin/bash
set -e

# -------------------------------
# AWS S3 storage configuration
# -------------------------------
export LABEL_STUDIO_STORAGE_BACKEND=s3
export LABEL_STUDIO_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export LABEL_STUDIO_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export LABEL_STUDIO_AWS_REGION=$AWS_REGION
export LABEL_STUDIO_S3_BUCKET=$AWS_BUCKET
export LABEL_STUDIO_S3_INPUT_PATH=$S3_INPUT_PATH
export LABEL_STUDIO_S3_OUTPUT_PATH=$S3_OUTPUT_PATH

# -------------------------------
# Enable invite-only registration
# -------------------------------
export LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=true

# -------------------------------
# Start Label Studio
# -------------------------------
label-studio start --host https://label-studio-render-cxdy.onrender.com --port $PORT