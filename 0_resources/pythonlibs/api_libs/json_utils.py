import json

def find_key_recursive(data, target_key):
    """Tìm kiếm key trong JSON ở mọi cấp độ."""
    if isinstance(data, dict):
        if target_key in data:
            return data[target_key]
        for key, value in data.items():
            result = find_key_recursive(value, target_key)
            if result is not None:
                return result
    elif isinstance(data, list):
        for item in data:
            result = find_key_recursive(item, target_key)
            if result is not None:
                return result
    return None

def check_json_params(json_data, base_param=None, *sub_params):
    """Kiểm tra JSON với base_param và sub_params."""
    try:
        data = json.loads(json_data)

        # Nếu không có BASE_PARAM, kiểm tra toàn bộ JSON
        if base_param:
            base_keys = base_param.split()
            base_data = data
            for key in base_keys:
                base_data = base_data.get(key, None)
                if base_data is None:
                    return False
        else:
            base_data = data  # Kiểm tra trên toàn bộ JSON nếu không có base_param

        # Nếu không có SUB_PARAMS, chỉ kiểm tra sự tồn tại của BASE_PARAM
        if not sub_params:
            return True

        for param in sub_params:
            param_value = find_key_recursive(base_data, param)
            if param_value is None or param_value == "":
                return False

        return True
    except Exception as e:
        print(f"Lỗi: {e}")
        return False

def validate_json(json_data, base_param=None, *sub_params):
    """Tích hợp kiểm tra vào Python, trả về True hoặc False."""
    return check_json_params(json_data, base_param, *sub_params)
