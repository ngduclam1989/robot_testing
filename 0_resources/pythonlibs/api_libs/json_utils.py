import json

def find_keys_recursive(data, target_key):
    results = []

    if isinstance(data, dict):
        for key, value in data.items():
            if key == target_key:
                results.append(value)
            else:
                results += find_keys_recursive(value, target_key)

    elif isinstance(data, list):
        for item in data:
            results += find_keys_recursive(item, target_key)

    return results

def validate_json(json_str, sub_params_str, sub_values_str=None):
    try:
        json_data = json.loads(json_str) if isinstance(json_str, str) else json_str

        sub_params = [s.strip() for s in sub_params_str.split(";") if s.strip()]
        sub_values = sub_values_str.split(";") if sub_values_str else []

        for idx, param_key in enumerate(sub_params):
            found_values = find_keys_recursive(json_data, param_key)

            if not found_values:
                print(f"Missing key: {param_key}")
                return False

            if idx < len(sub_values):
                expected = sub_values[idx]
                if expected != "":
                    matched = any(str(val) == expected for val in found_values)
                    if not matched:
                        print(f"Mismatch for '{param_key}': found {found_values}, expected '{expected}'")
                        return False

        return True

    except Exception as e:
        print(f"Error: {e}")
        return False