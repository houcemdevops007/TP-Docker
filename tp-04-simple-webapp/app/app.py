import os
from flask import Flask, jsonify
import redis

app = Flask(__name__)

# Connect to Redis using the host specified in environment variables
redis_host = os.environ.get("REDIS_HOST", "localhost")
r = redis.Redis(host=redis_host, port=6379, decode_responses=True)

@app.route("/")
def home():
    try:
        count = r.incr("hits")
        return jsonify({"message": f"Hello! Visitors count: {count}"})
    except redis.exceptions.ConnectionError:
        return jsonify({"message": "Hello! Cannot connect to Redis."}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
