import os
from flask import Flask, jsonify
import psycopg2
from psycopg2 import OperationalError

app = Flask(__name__)

DB_HOST = os.environ.get("DB_HOST", "db")
DB_USER = os.environ.get("DB_USER", "postgres")
DB_PASS = os.environ.get("DB_PASS", "postgres")

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database="metrics",
            user=DB_USER,
            password=DB_PASS
        )
        return conn
    except OperationalError as e:
        return None

def init_db():
    conn = get_db_connection()
    if conn:
        cur = conn.cursor()
        cur.execute("CREATE TABLE IF NOT EXISTS hits (count integer);")
        cur.execute("SELECT count FROM hits;")
        if not cur.fetchone():
            cur.execute("INSERT INTO hits (count) VALUES (0);")
        conn.commit()
        cur.close()
        conn.close()

@app.route("/api/health")
def health():
    conn = get_db_connection()
    if conn:
        conn.close()
        return jsonify({"status": "healthy"}), 200
    return jsonify({"status": "unhealthy, cannot connect to db"}), 503

@app.route("/api/count")
def count():
    conn = get_db_connection()
    if conn:
        cur = conn.cursor()
        cur.execute("UPDATE hits SET count = count + 1 RETURNING count;")
        new_count = cur.fetchone()[0]
        conn.commit()
        cur.close()
        conn.close()
        return jsonify({"message": "Successful hit!", "visitors": new_count})
    return jsonify({"error": "Database error"}), 500

if __name__ == "__main__":
    import time
    time.sleep(2) # Give DB a moment before init
    init_db()
    app.run(host="0.0.0.0", port=5000)
