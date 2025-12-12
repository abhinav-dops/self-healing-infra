from flask import Flask, jsonify
import os
import psutil   # optional for CPU info

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify(message="Hello from Self-Healing App", status="ok")

# health endpoint that we can use in alarms
@app.route("/health")
def health():
    return jsonify(status="healthy")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
