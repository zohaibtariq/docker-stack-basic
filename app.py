from flask import Flask
import socket
import random
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Get the ENV variable from the .env file
    env = os.getenv('ENV', 'undefined')  # Default to 'undefined' if ENV is not set
    return (
        f"Hello, World! Random Number: {random.randint(1, 100)}<br>"
        f"Instance: {socket.gethostname()}<br>"
        f"Environment: {env}"
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)