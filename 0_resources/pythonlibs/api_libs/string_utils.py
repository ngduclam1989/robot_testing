import random
import string

def replace_string_by_char_to_validate_json(data):
    dict_str = str(data)
    new_text = dict_str.replace("'", '"')
    new_text = new_text.replace("None", '""')
    return new_text

def random_string_value():
    length = 10
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=length))
    return random_string

def replace_string_to_generate_data(text, char, newchar):
    replace_string = str(text)
    new_text = replace_string.replace(char, newchar)
    return  new_text
