import requests
import json
import random
import string
from robot.libraries.BuiltIn import BuiltIn

def call_api(url, method, data):


    headers = {
        "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwNWUzYjcyNy02ZmE2LTRmY2UtYWRkZS00YTZhMDEwNjg3N2IiLCJhdWQiOlsib2F1dGgyLXJlc291cmNlIl0sInVzZXJfbmFtZSI6IjA1ZTNiNzI3LTZmYTYtNGZjZS1hZGRlLTRhNmEwMTA2ODc3YiIsInNjb3BlIjpbInJlYWQiXSwiZXhwIjoxNzQzNjg4NDk0LCJpYXQiOjE3NDM2ODQ4OTQsImp0aSI6IjA3YzFmZGI2LWJmYjEtNGQ5NC1iYjUwLTM1MTA0ZWZlNzU0NiIsImNsaWVudF9pZCI6ImYxMzU0OTg2LWU2OTgtNDcxMi1iYTk0LWU5NGIxMGJmMWI1OCJ9.gvtiZekt99tm9zGIa7eD4Rgo5IeYkei0rYXfKIQgahyr6zYQevlKvp-mUWpWGFpHz0Ru67VPIdZuWwEiW1eDPWK3M9XX8-2x64UxB2Hl7vep2M1zSaMp_Ng3-JY0i3wYEG6y38vhpYf0uyor7za2YjCBQdPKA9qLYWlJbW69BHT2YvRSQa_Ppr0TGOAcWWswScL9Xw6Ai2sShAbv4Lrvdp-i-0Q7cRufsymy-vBRvfKIStcGmMuRMA79OVol9Mv_ni33nCa6gTQgu8xjNA3ZjvWR-um2z8zIVfgKN7337W-M3tvWDE8fuj4m8BjRor_iSYU1wPUtGvYzLNnKrrpcUQ",
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



def call_api_login(url, method, data=None, headers=None):
    headers = {}
    headers["Content-Type"] = "application/json"

    datas = {
        "username": "admin_role",
        "password": "aA12345678@"
    }

    results = {}

    try:
        response = None
        if method == "PUT":
            response = requests.put(url, headers=headers, data=json.dumps(data) if data else None)
        elif method == "GET":
            response = requests.get(url, headers=headers)
        elif method == "PATCH":
            response = requests.patch(url, headers=headers, data=json.dumps(data) if data else None)
        elif method == "POST":
            response = requests.post(url, headers=headers, data=datas if data else None)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers)
        results["status_code"] = response.status_code
        results["response"] = response.json() if response.text else {}

    except requests.exceptions.RequestException as e:
        results["status_code"] = "Có lỗi xảy ra"
        results["error"] = str(e)

    return results

def load_data_to_json(data):
    json_object = json.loads(data)
    return  json_object

def replace_string_by_char_to_validate_json(data):
    dict_str = str(data)
    new_text = dict_str.replace("'", '"')
    new_text = new_text.replace("None", '""')
    return new_text

def random_string_value():
    length = 10
    random_string = ''.join(random.choices(string.ascii_letters + string.digits + string.punctuation, k=length))
    return random_string

def replace_string_to_generate_data(text, char, newchar):
    replace_string = str(text)
    new_text = replace_string.replace(char, newchar)
    return  new_text


