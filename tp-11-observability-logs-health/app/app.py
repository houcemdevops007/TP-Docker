import time
import os
from flask import Flask, jsonify, request

app = Flask(__name__)

# Very basic metric tracking (Enriched Prometheus concept simulation)
metrics = {
    "requests_total": 0,
    "health_checks": 0
}

@app.route("/")
def home():
    metrics["requests_total"] += 1
    return jsonify({"message": "Observable API"}), 200

@app.route("/health")
def health():
    metrics["health_checks"] += 1
    return jsonify({"status": "Healthy"}), 200

# ENRICHED: Exposing metrics for Prometheus to scrape!
@app.route("/metrics")
def get_metrics():
    output = f"# HELP requests_total Total number of HTTP requests\n"
    output += f"# TYPE requests_total counter\n"
    output += f"requests_total {metrics['requests_total']}\n"
    output += f"# HELP health_checks Total number of health checks\n"
    output += f"# TYPE health_checks counter\n"
    output += f"health_checks {metrics['health_checks']}\n"
    
    # Return as plain text which is what Prometheus expects
    return output, 200, {'Content-Type': 'text/plain; charset=utf-8'}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
