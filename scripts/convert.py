#!/usr/bin/env python3
import json
import os
from os import path


def hex_to_rgb(value):
    value = value.lstrip('#')
    lv = len(value)
    return tuple(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))


def convert_file(filename):
    result = {}

    output_filename = f'themes/{path.basename(filename)}'

    with open(filename, 'r') as file:
        data = json.load(file)

        for key in data:
            value = data[key].lstrip('#')

            r, g, b = hex_to_rgb(value)

            result[key] = {
                'r': r,
                'g': g,
                'b': b,
                'hex': value
            }

    with open(output_filename, 'w') as dest:
        json.dump(result, dest, indent=4)

    print(f'wrote file to: {output_filename}')


if __name__ == '__main__':
    print("Convert JSON to structured JSON")

    json_files = [pos_json for pos_json in os.listdir("themes/raw") if pos_json.endswith('.json')]
    for json_file in json_files:
        print(f"converting {json_file}")
        convert_file(f'themes/raw/{json_file}')
