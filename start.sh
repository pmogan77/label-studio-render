#!/bin/bash
set -e

echo "------------------------------------"
echo "🌐 Starting Label Studio container..."
echo "------------------------------------"

# -------------------------------
# AWS S3 storage configuration
# -------------------------------
export STORAGE_TYPE="s3"
export STORAGE_AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export STORAGE_AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
export STORAGE_AWS_REGION_NAME="$AWS_REGION"
export STORAGE_AWS_BUCKET_NAME="$AWS_BUCKET"
export STORAGE_AWS_FOLDER="$S3_INPUT_PATH"
export STORAGE_AWS_ENDPOINT_URL="$AWS_ENDPOINT_URL"

# -------------------------------
# Database configuration (Supabase)
# -------------------------------
export DJANGO_DB="postgresql"
export POSTGRE_USER="postgres.tidaxghxsacxcqdonddc"
export POSTGRE_PASSWORD="$POSTGRE_PASSWORD"
export POSTGRE_NAME="postgres"
export POSTGRE_HOST="$POSTGRE_HOST"
export POSTGRE_PORT="5432"

echo "🗄️  Using PostgreSQL host: $POSTGRE_HOST"
echo "🪣 Using S3 bucket: $AWS_BUCKET ($AWS_REGION)"

# -------------------------------
# Security / CSRF configuration
# -------------------------------
export LABEL_STUDIO_DISABLE_SIGNUP_WITHOUT_LINK=false
export CSRF_TRUSTED_ORIGINS="https://label-studio-render-cxdy.onrender.com,http://localhost:8080,http://127.0.0.1:8080"
export USE_ENFORCE_CSRF_CHECKS=false

# -------------------------------
# Optional: Set secret key for consistency across restarts
# -------------------------------
if [ -z "$SECRET_KEY" ]; then
  export SECRET_KEY=$(python -c "import secrets; print(secrets.token_urlsafe(50))")
  echo "⚠️  No SECRET_KEY set, generating a temporary one..."
else
  echo "🔑 Using provided SECRET_KEY."
fi

# -------------------------------
# Start Label Studio
# -------------------------------
echo "🚀 Starting Label Studio on port ${PORT:-8080}..."
label-studio start --host https://label-studio-render-cxdy.onrender.com --port ${PORT:-8080}
