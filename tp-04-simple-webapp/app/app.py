import os
import time
from flask import Flask, jsonify
import redis
from redis.exceptions import ConnectionError

app = Flask(__name__)

# ENRICHED: Connection retry mechanism (Crucial for production when DB boots slower than App)
redis_host = os.environ.get("REDIS_HOST", "localhost")

def get_redis_client(retries=5, delay=2):
    for i in range(retries):
        try:
            r = redis.Redis(host=redis_host, port=6379, decode_responses=True)
            r.ping() # Force connection check
            return r
        except ConnectionError:
            print(f"Redis unavailable, retrying in {delay} seconds... ({i+1}/{retries})")
            time.sleep(delay)
    return None

r = get_redis_client()

@app.route("/")
def home():
    if not r:
        return jsonify({"message": "Hello! Cannot connect to Redis. Check network."}), 500
    try:
        count = r.incr("hits")
        return jsonify({
            "message": f"Hello User! Visitors count: {count}",
            "hostname": os.uname()[1] # Identify which container answered (useful for load balancing)
        })
    except Exception as e:
        return jsonify({"message": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
