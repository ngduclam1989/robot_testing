import requests
import json
from robot.libraries.BuiltIn import BuiltIn

def call_api(url, method, data=None  ):


    headers = {
        "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwNWUzYjcyNy02ZmE2LTRmY2UtYWRkZS00YTZhMDEwNjg3N2IiLCJhdWQiOlsib2F1dGgyLXJlc291cmNlIl0sInVzZXJfbmFtZSI6IjA1ZTNiNzI3LTZmYTYtNGZjZS1hZGRlLTRhNmEwMTA2ODc3YiIsInNjb3BlIjpbInJlYWQiXSwiZXhwIjoxNzQzNjY3NzUyLCJpYXQiOjE3NDM2NjQxNTIsImp0aSI6IjQ1MDk4NTUzLTMzY2YtNDZkNy04OTNhLWM3OTE2OGM4NjRlNCIsImNsaWVudF9pZCI6ImYxMzU0OTg2LWU2OTgtNDcxMi1iYTk0LWU5NGIxMGJmMWI1OCJ9.Z1McEYZ1PbQUCLbqrBCEpwyi5ifLdiGV8gQrFVyy-v8m00KWhZ7ypZYE77iyHzrCH7cb0Ju09o-Vz7ZId-G2VB8QnCTOJX8yN-MCUjZdYV1NLvyaa9fyn8kcA3ilAU72sFqJyDr25fk5escaW_FGnTRi4goqDdQc_jujL4NtdSg5pyM-wzAoP_JhomS4T-dmGyUkCcnK-Gjz0oCI-YRHNLyR9_fpy26ZE-KIw9oACBGKyPy5DqVFlIMeVDjv5ud6yBuN6QwKE03FDoGcszY1BnzTH9lWG_Lc-yD4XJzzdjn-oqyV7zKlqigLQW3wlKi6ZZjGVa0j4FPeubcpb16nXg",
        "Content-Type": "application/json"
    }

    results = {}

    try:
        response = None
        if method == "PUT":
            response = requests.put(url, headers=headers,  data=json.dumps(data) if data else None)
        elif method == "GET":
            response = requests.get(url, headers=headers)
        elif method == "PATCH":
            response = requests.patch(url, headers=headers,  data=json.dumps(data) if data else None)
        elif method == "POST":
            response = requests.post(url, headers=headers,  data=json.dumps(data) if data else None)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers)
        results["status_code"] = response.status_code
        results["response"] = response.json() if response.text else {}

    except requests.exceptions.RequestException as e:
        results["status_code"] = "Có lỗi xảy ra"
        results["error"] = str(e)

    return results


def call_api_with_param(url, method, data=None, headers=None, params_keys=None, params_values=None):
    headers = {}
    headers["Content-Type"] = "application/json"

    params = {}
    if params_keys and params_values:
        keys = params_keys.split(";")
        values = params_values.split(";")
        params = dict(zip(keys, values))

    results = {}

    try:
        response = None
        if method == "PUT":
            response = requests.put(url, headers=headers, params=params, data=json.dumps(data) if data else None)
        elif method == "GET":
            response = requests.get(url, headers=headers, params=params)
        elif method == "PATCH":
            response = requests.patch(url, headers=headers, params=params, data=json.dumps(data) if data else None)
        elif method == "POST":
            response = requests.post(url, headers=headers, params=params, data=json.dumps(data) if data else None)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers, params=params)
        results["status_code"] = response.status_code
        results["response"] = response.json() if response.text else {}

    except requests.exceptions.RequestException as e:
        results["status_code"] = "Có lỗi xảy ra"
        results["error"] = str(e)

    return results


def load_data_to_json(data):
    json_object = json.loads(data)
    return  json_object

