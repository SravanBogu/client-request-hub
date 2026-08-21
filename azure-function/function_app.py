import json
import azure.functions as func

app = func.FunctionApp(http_auth_level=func.AuthLevel.FUNCTION)

REQUESTS = {
    "CRH-1001": {
        "requestId": "CRH-1001",
        "status": "Pending Approval",
        "requestType": "Equipment",
        "lastUpdated": "2026-08-20T13:15:00Z"
    },
    "CRH-1002": {
        "requestId": "CRH-1002",
        "status": "Assigned",
        "requestType": "Maintenance",
        "lastUpdated": "2026-08-20T12:10:00Z"
    }
}

@app.route(route="requests/{request_id}", methods=["GET"])
def get_request_status(req: func.HttpRequest) -> func.HttpResponse:
    request_id = req.route_params.get("request_id", "").upper().strip()

    if not request_id:
        return func.HttpResponse(
            json.dumps({"error": "request_id is required"}),
            status_code=400,
            mimetype="application/json"
        )

    request = REQUESTS.get(request_id)
    if request is None:
        return func.HttpResponse(
            json.dumps({"error": "Request not found"}),
            status_code=404,
            mimetype="application/json"
        )

    return func.HttpResponse(
        json.dumps(request),
        status_code=200,
        mimetype="application/json"
    )