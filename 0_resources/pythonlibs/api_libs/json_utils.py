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

        # Tách danh sách BASE_PARAM, SUB_PARAMS, SUB_VALUES
        base_params_list = base_param.strip(";").split(";") if base_param else []
        sub_params_list = sub_params.strip(";").split(";") if sub_params else []
        sub_values_list = sub_params_value.strip(";").split(";") if sub_params_value else []

        # Đảm bảo SUB_VALUES có đúng số lượng
        while len(sub_values_list) < len(base_params_list) * len(sub_params_list):
            sub_values_list.append("")

        # Kiểm tra từng BASE_PARAM
        for base_idx, base in enumerate(base_params_list):
            base_data = find_nested_key(data, base)

            if base_data is None:
                raise AssertionError(f"Error: Missing `{base}` in JSON.")

            # Kiểm tra từng SUB_PARAM trong BASE_PARAM
            for sub_idx, sub in enumerate(sub_params_list):
                actual_value = find_nested_key(base_data, sub)

                if actual_value is None:
                    raise AssertionError(f"Error: Missing `{sub}` in `{base}`.")

                # Tính vị trí chính xác của SUB_VALUES
                expected_value = sub_values_list[base_idx * len(sub_params_list) + sub_idx]

                if expected_value != "" and actual_value != expected_value:
                    raise AssertionError(f"Error: `{sub}` in `{base}` has value `{actual_value}`, expected `{expected_value}`.")

    except json.JSONDecodeError:
        raise AssertionError("Error: Invalid JSON format.")
    except Exception as e:
        raise AssertionError(f"Unexpected error: {e}")
