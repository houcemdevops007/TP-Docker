import time
from flask import Flask, jsonify

app = Flask(__name__)
startup_time = time.time()

@app.route("/")
def home():
    return jsonify({"message": "App is running!"})

@app.route("/health")
def health():
    # Simulate an app that takes 10 seconds to become completely healthy
    if time.time() - startup_time < 10:
        return jsonify({"status": "starting"}), 503
    return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
