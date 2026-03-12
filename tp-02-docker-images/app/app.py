import os
from flask import Flask, jsonify

app = Flask(__name__)

# Reading environment variable injected via Docker
ENV_NAME = os.environ.get("ENV_NAME", "Development")

@app.route("/")
def home():
    return jsonify({
        "message": "Hello DevOps ver. 2.0 (Enriched)",
        "environment": ENV_NAME,
        "status": "Running smoothly"
    })

@app.route("/health")
def health():
    return jsonify({"status": "Healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
