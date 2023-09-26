import re

def load_texture_list(chn):
    texture_list = {}
    for texture_data in re.findall(r"course_texture \w+_textures\[\] *= *\{.*\n* *((?: +.+\n)+)", chn):
        base_addr = 0x05000000
        for texture_name, file_size, data_size in re.findall(r" +\{(.+), (\w+), (\w+),", texture_data):
            texture_list[base_addr] = [texture_name, file_size, data_size]
            base_addr += int(data_size, 16)
    return texture_list

def load_texture_path(chn):
    texture_path = {}
    for variable_name, path in re.findall(r"glabel (\w+)\n.incbin \"(.+)\.mio0\"", chn):
        texture_path[variable_name] = path
    return texture_path

def load_texture_path2(chn):
    texture_path = {}
    for variable_name, path in re.findall(r"u8 (\w+)\[\] *= *\{.*\n *#include *\"([\w/]+)", chn):
        texture_path[variable_name] = path
    return texture_path

def link_texture(texture_list, texture_path):
    texture_link = {}
    for texture_addr, (texture_name, file_size, data_size) in texture_list.items():
        texture_link[texture_addr] = texture_path[texture_name]
    return texture_link

if __name__ == "__main__":
    load_texture_list(open("src/course_banshee_boardwalk_offsets.c", "r").read())
    load_texture_path(open("data/other_textures.s", "r").read())