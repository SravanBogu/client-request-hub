def test_request_status_contract():
    request = {
        "requestId": "CRH-1001",
        "status": "Pending Approval",
        "requestType": "Equipment",
        "lastUpdated": "2026-08-20T13:15:00Z"
    }

    assert request["requestId"] == "CRH-1001"
    assert request["status"] == "Pending Approval"
    assert "lastUpdated" in request