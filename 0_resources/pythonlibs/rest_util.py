from robot.libraries.BuiltIn import BuiltIn
import types
from copy import deepcopy
import base64
import sys

IS_PYTHON_2 = sys.version_info < (3,)

if IS_PYTHON_2:
    STRING_TYPES = (unicode, str)
else:
    STRING_TYPES = (str)


def delete_with_body(endpoint, body=None, timeout=None, allow_redirects=None,
                     validate=True, headers=None):
    rest_instance = BuiltIn().get_library_instance('REST')
    endpoint = rest_instance._input_string(endpoint)
    request = deepcopy(rest_instance.request)
    request['method'] = "DELETE"
    request['body'] = rest_instance.input(body)
    if allow_redirects is not None:
        request['allowRedirects'] = rest_instance._input_boolean(allow_redirects)
    if timeout is not None:
        request['timeout'] = rest_instance._input_timeout(timeout)
    validate = rest_instance._input_boolean(validate)
    if headers:
        request['headers'].update(rest_instance._input_object(headers))
    return rest_instance._request(endpoint, request, validate)['response']


def _instantiate(self, request, response, validate_schema=True):
    try:
        response = {
            'seconds': response.elapsed.microseconds / 1000 / 1000,
            'status': response.status_code,
            'body': response.json(),
            'headers': dict(response.headers)
        }
    except ValueError:
        response = {
            'seconds': response.elapsed.microseconds / 1000 / 1000,
            'status': response.status_code,
            'body': response.text,
            'headers': dict(response.headers),
            'content_base64': base64.b64encode(response.content)
        }

    schema = deepcopy(self.schema)
    schema['title'] = "%s %s" % (request['method'], request['url'])
    schema['description'] = "%s: %s" % (
        BuiltIn().get_variable_value("${SUITE NAME}"),
        BuiltIn().get_variable_value("${TEST NAME}")
    )
    request_properties = schema['properties']['request']['properties']
    response_properties = schema['properties']['response']['properties']
    if validate_schema:
        if request_properties:
            self._validate_schema(request_properties, request)
        if response_properties:
            self._validate_schema(response_properties, response)
    request_properties['body'] = self._new_schema(request['body'])
    request_properties['query'] = self._new_schema(request['query'])
    response_properties['body'] = self._new_schema(response['body'])
    if 'default' in schema and schema['default']:
        self._add_defaults_to_schema(schema, response)
    return {
        'request': request,
        'response': response,
        'schema': schema,
        'spec': self.spec
    }


def enable_rest_content_base_64():
    rest_instance = BuiltIn().get_library_instance('REST')
    rest_instance._instantiate = types.MethodType(_instantiate, rest_instance)


def rest_extract(what="", sort_keys=False, print_log=False):
    rest_instance = BuiltIn().get_library_instance('REST')
    if isinstance(what, STRING_TYPES):
        if what == "":
            try:
                json = deepcopy(rest_instance._last_instance_or_error())
                json.pop('schema')
                json.pop('spec')
            except IndexError:
                raise RuntimeError("Error")
        elif what.startswith(("request", "response", "$")):
            rest_instance._last_instance_or_error()
            matches = rest_instance._find_by_field(what, return_schema=False, print_found=print_log)
            if len(matches) > 1:
                json = [found['reality'] for found in matches]
            else:
                json = matches[0]['reality']
        else:
            try:
                json = rest_instance._input_json_as_string(what)
            except ValueError:
                json = rest_instance._input_string(what)
    else:
        json = rest_instance._input_json_from_non_string(what)
    sort_keys = rest_instance._input_boolean(sort_keys)
    rest_instance.log_json(json, also_console=print_log, sort_keys=sort_keys)
    return json


def rest_has_field(field):
    rest_instance = BuiltIn().get_library_instance('REST')
    try:
        matches = rest_instance._find_by_field(field, print_found=False)
    except AssertionError:
        return False
    return len(matches) > 0