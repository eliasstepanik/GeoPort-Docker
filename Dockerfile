# Use the official Python image as the base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY src/ ./src/

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libusb-1.0-0 \
    libplist-utils \
    && rm -rf /var/lib/apt/lists/*

# Expose the port the Flask app runs on
EXPOSE 54321

# Set environment variables (if necessary)
ENV PYTHONUNBUFFERED=1

# Define the command to run the application
CMD ["python", "src/main.py"]
