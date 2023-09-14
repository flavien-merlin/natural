FROM python:3.9.17-slim

WORKDIR /app

# Copy the Flask app to the container
COPY ./src .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Expose the port
EXPOSE 5000

CMD ["python", "app.py"]
