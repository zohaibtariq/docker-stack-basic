# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py



# Added Environment Support
ARG ENVIRONMENT=local
ENV ENVIRONMENT=$ENVIRONMENT

# Run app.py when the container launches
CMD ["sh", "-c", "echo Running in $ENVIRONMENT && python app.py"]

