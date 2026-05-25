from flask import Flask
from prometheus_client import Counter, generate_latest
from flask import Response

app = Flask(__name__)

REQUEST_COUNT = Counter(
    'app_requests_total',
    'Total app requests'
)

@app.route("/")
def home():
    REQUEST_COUNT.inc()
    return "Flask app running"

@app.route("/metrics")
def metrics():
    return Response(
        generate_latest(),
        mimetype="text/plain"
    )

if __name__=="__main__":
    app.run(host="0.0.0.0", port=5000)