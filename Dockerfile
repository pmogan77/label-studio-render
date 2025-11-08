FROM python:3.11-slim

WORKDIR /app

# Copy all files
COPY . /app

# Print contents to verify
RUN echo "Files in /app:" && ls -la /app

# Install dependencies
RUN echo "Installing Python dependencies..." && \
    pip install --no-cache-dir -r requirements.txt && \
    echo "Dependencies installed successfully."

# Expose port (for reference)
EXPOSE 8080

# Make sure start.sh is executable
RUN chmod +x start.sh && echo "start.sh permissions set"

# Add debug wrapper for start.sh
CMD echo "Starting Label Studio..." && ./start.sh && echo "start.sh exited"
