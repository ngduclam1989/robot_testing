import json

def find_nested_key(data, key):
    """Tìm kiếm key ở mọi cấp trong JSON."""
    if isinstance(data, dict):
        if key in data:
            return data[key]
        for v in data.values():
            found = find_nested_key(v, key)
            if found is not None:
                return found
    elif isinstance(data, list):
        for item in data:
            found = find_nested_key(item, key)
            if found is not None:
                return found
    return None

def validate_json(json_data, base_param="", sub_params="", sub_params_value=""):
    try:
        data = json.loads(json_data)

        # Điều hướng đến base_param nếu có
        if base_param:
            keys = base_param.split("/")
            for key in keys:
                if key in data:
                    data = data[key]
                else:
                    raise AssertionError(f"Error: Missing `{key}` in JSON.")

        # Tách danh sách params và values
        sub_params_list = sub_params.strip(";").split(";") if sub_params else []
        sub_values_list = sub_params_value.split(";") if sub_params_value else []

        # Đảm bảo số lượng giá trị khớp với số param
        while len(sub_values_list) < len(sub_params_list):
            sub_values_list.append("")

        # Kiểm tra từng param trong JSON
        for i, param in enumerate(sub_params_list):
            actual_value = find_nested_key(data, param)

            if actual_value is None:
                raise AssertionError(f"Error: Missing `{param}` in JSON.")

            # Giữ nguyên giá trị mong đợi, không strip() để tránh mất ""
            expected_value = sub_values_list[i]
            if expected_value != actual_value:
                raise AssertionError(f"Error: `{param}` has value `{actual_value}`, expected `{expected_value}`.")

    except json.JSONDecodeError:
        raise AssertionError("Error: Invalid JSON format.")
    except Exception as e:
        raise AssertionError(f"Unexpected error: {e}")
