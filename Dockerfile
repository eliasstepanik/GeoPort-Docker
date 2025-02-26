# Use the official Python image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libimobiledevice6 \
    usbmuxd \
    libplist3 \
    libusbmuxd-tools \
    ideviceinstaller \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port that the application runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "src/main.py"]
