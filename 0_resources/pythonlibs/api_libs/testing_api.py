import requests
import json
from robot.libraries.BuiltIn import BuiltIn

def call_api(url, method, data):
    headers = {}
    headers["Content-Type"] = "application/json"

    results = {}

    try:
        if method == "PUT":
            response = requests.put(url, headers=headers, data=data)
        if method == "GET":
            response = requests.get(url, headers=headers)
        if method == "PATCH":
            response = requests.patch(url, headers=headers, data=data)
        if method == "POST":
            response = requests.post(url, headers=headers, data=data)
        if method == "DELETE":
            response = requests.delete(url, headers=headers)
        results["status_code"] = response.status_code
        results["response"] = response.text

    except requests.exceptions.RequestException:
        results["status_code"] = "Có lỗi xảy ra"

    return results

def call_api_has_param(url, method, params, data):
    headers = {}
    headers["Content-Type"] = "application/json"

    results = {}

    try:
        if method == "PUT":
            response = requests.put(url, headers=headers, data=data)
        if method == "GET":
            response = requests.get(url, headers=headers, params=params)
        if method == "PATCH":
            response = requests.patch(url, headers=headers, data=data)
        if method == "POST":
            response = requests.post(url, headers=headers, params=params, data=data)
        if method == "DELETE":
            response = requests.delete(url, headers=headers)
        results["status_code"] = response.status_code
        results["response"] = response.text

    except requests.exceptions.RequestException:
        results["status_code"] = "Sai Domain"

    return results


def load_data_to_json(data):
    json_object = json.loads(data)
    return  json_object

def call_api_magnet_get_journey(url, method, authorization, x_merchant_id,  content_type, journey_ids, lang):
    headers = {
        "Authorization": authorization.strip(),
        "Content-Type": content_type.strip(),
        "X-Merchant-ID": x_merchant_id.strip()
    }

    params = {
        'journey_ids': journey_ids,
        'lang': lang
    } if journey_ids != "EMPTY" else {
        'lang': lang
    }

    results = {}

    try:
        if method == "POST":
            response = requests.post(url, params=params, headers=headers)
        if method == "GET":
            response = requests.get(url, params=params, headers=headers)
        response.raise_for_status()
        results["status_code"] = response.status_code
        results["response"] = response.text

    except requests.exceptions.HTTPError as err:
        if err.response.status_code != 200:
            results["status_code"] = response.status_code

    except requests.exceptions.RequestException:
        results["status_code"] = "Sai Domain"

    return results



