import requests
import json
import random
import string
from robot.libraries.BuiltIn import BuiltIn

def call_api(url,header, method, data):



    results = {}

    try:
        response = None
        if method == "PUT":
            response = requests.put(url, headers=header,  data=data)
        elif method == "GET":
            response = requests.get(url, headers=header)
        elif method == "PATCH":
            response = requests.patch(url, headers=header,  data=data)
        elif method == "POST":
            response = requests.post(url, headers=header,  data=data)
        elif method == "DELETE":
            response = requests.delete(url, headers=header)
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



def call_api_login(url, method, data):
    headers = {}
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "*/*"

    results = {}
    try:
        response = None
        if method == "PUT":
            response = requests.put(url, headers=headers,  data=data)
        elif method == "GET":
            response = requests.get(url, headers=headers)
        elif method == "PATCH":
            response = requests.patch(url, headers=headers,  data=data)
        elif method == "POST":
            response = requests.post(url, headers=headers,  data=data)
        elif method == "DELETE":
            response = requests.delete(url, headers=headers)
        results["status_code"] = response.status_code
        results["response"] = response.json() if response.text else {}
    except requests.exceptions.RequestException as e:
        results["status_code"] = "Có lỗi xảy ra"
        results["error"] = str(e)
    return results

def headers():
    headers = {}
    headers['Content-Type'] = 'application/json'
    return headers

def headers_with_accept_and_access_token(auth):
    headers = {}
    headers['Authorization'] = auth
    headers['Accept']='*/*'
    headers['Content-Type'] = 'application/json'
    return headers


def load_data_to_json(data):
    json_object = json.loads(data)
    return  json_object

def load_dictionary_to_json(data):
    json_str = json.dumps(data)
    return  json_str