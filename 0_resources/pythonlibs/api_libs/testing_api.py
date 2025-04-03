import requests
import json
import random
import string
from robot.libraries.BuiltIn import BuiltIn

def call_api(url,authorization, method, data):


    headers = {
        "Authorization": authorization.strip(),
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



def call_api_login(url, method, data):
    headers = {}
    headers["Content-Type"] = "application/json"

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


