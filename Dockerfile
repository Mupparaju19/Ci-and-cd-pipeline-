# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Install debugging tools (optional but helpful)
RUN apt-get update && apt-get install -y curl procps net-tools

# Set the working directory in the container
WORKDIR /app

# Copy the application dependencies requirement files to the working directory
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY app.py .

# Set environment variables to force Flask to use port 8000
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV FLASK_RUN_HOST=0.0.0.0

# Ensure Flask runs on port 8000
ENV FLASK_RUN_PORT=8000  

# Expose port 8000
EXPOSE 8000

# Start Flask with the correct port
CMD ["flask", "run"]
