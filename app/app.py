from flask import Flask
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from flask import Response
from prometheus_flask_exporter import PrometheusMetrics
app = Flask(__name__)

metrics = PrometheusMetrics(app)

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
        mimetype=CONTENT_TYPE_LATEST
    )

if __name__=="__main__":
    app.run(host="0.0.0.0", port=5000)