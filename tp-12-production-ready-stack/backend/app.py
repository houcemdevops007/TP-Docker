from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/api/status")
def status():
    # In a real app we'd query DB and Redis here
    return jsonify({
        "status": "Production API is LIVE",
        "worker": os.getpid(),
        "db": os.environ.get("DATABASE_URL", "Not Set")
    }), 200

if __name__ == "__main__":
    app.run()
