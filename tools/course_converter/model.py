from __future__ import annotations
import re
import os
from vertex import Vertex, extract_vertex_file
from texture import load_texture_list, load_texture_path, load_texture_path2
from shutil import copytree

class Material:
    name: str
    texture: str

    def __init__(self, name: str, texture: str) -> None:
        self.name = name
        self.texture = texture

    def __str__(self) -> str:
        return "newmtl " + self.name + "\n" + \
            "Ns 1000.000000\n" + \
            "Ka 1.000000 1.000000 1.000000\n" + \
            "Kd 1.000000 1.000000 1.000000\n" + \
            "Ks 0.000000 0.000000 0.000000\n" + \
            "Ni 1.000000\n" + \
            "d 1.0\n" + \
            "illum 2\n" + \
            "map_Kd " + self.texture + ".png\n\n"

class Model:
    vertex: Vertex
    faces: list[int]
    name: str
    switch_materials: list[tuple[int,str]]
    materials: list[Material]

    def __init__(self) -> None:
        self.vertex = Vertex()
        self.faces = []
        self.materials = []
        self.switch_materials = []
        self.name = ""
    
    def from_file(self, model_str:str, vertex_set:dict[Vertex] = {}, model_set:dict[str, Model] = {}, default="", texture_path = {}, texture_list = {}):
        offset = 0
        if "//" in model_str:
            print(model_str)
        for value in re.findall(r"(\b[^()]+)\((.*)\)", model_str):
            args = value[1].split(",")
            function_name = value[0]
            match function_name:
                case "gsSPVertex":
                    vertex_name = args[0]
                    number_of_vertex = int(args[1])
                    if vertex_name.startswith("0x04"):
                        curent_offset = int(vertex_name, 16) - 0x04000000
                        curent_offset //= 0x10
                        vertex_name = default
                        self.vertex.append(vertex_set[vertex_name][curent_offset:curent_offset+number_of_vertex])
                    else:
                        self.vertex.append(vertex_set[vertex_name][:number_of_vertex])
                    offset = len(self.vertex) - number_of_vertex
                case "gsSP1Triangle":
                    self.faces.append([int(args[0])+offset, int(args[1])+offset, int(args[2])+offset])
                case "gsSP2Triangles":
                    self.faces.append([int(args[0])+offset, int(args[1])+offset, int(args[2])+offset])
                    self.faces.append([int(args[4])+offset, int(args[5])+offset, int(args[6])+offset])
                case "gsDPSetTextureImage":
                    if "0x" in args[3]:
                        texture_addr = int(args[3], 16)
                        if texture_addr in texture_list:
                            texture_variable = texture_list[texture_addr][0]
                        else:
                            print("Error: texture not found")
                            print(args)
                            print(self)
                            exit()
                    else:
                        texture_variable = args[3]
                    texture_variable = texture_variable.replace(" ", "")
                    texture_path_ = texture_path[texture_variable]
                    material = Material(texture_variable, texture_path_)
                    self.materials.append(material)
                    self.switch_materials.append((len(self.faces), texture_variable))
                case "gsSPDisplayList":
                    offset = len(self.vertex)
                    self.vertex.append(model_set[args[0]].vertex)
                    i = 0
                    n = 0
                    offace = len(self.faces)
                    for f in model_set[args[0]].faces:
                        if n<len(model_set[args[0]].switch_materials) and i == model_set[args[0]].switch_materials[n][0]:
                            self.switch_materials.append((
                                model_set[args[0]].switch_materials[n][0]+offace,
                                model_set[args[0]].switch_materials[n][1]
                            ))
                            n+=1
                        self.faces.append([f[0]+offset, f[1]+offset, f[2]+offset])
                        i+=1
                    for m in model_set[args[0]].materials:
                        if m.name in [m_.name for m_ in self.materials]:
                            continue
                        self.materials.append(m)
    
    def export_obj(self):
        if len(self.vertex) < 1:
            return
        file = open("obj/" + self.name + ".obj", "w")
        file.write("mtllib " + self.name + ".mtl\n")
        file.write("o " + self.name + "\n")
        i = 0
        n = 0
        for vertex_ in self.vertex:
            file.write("v " + str(vertex_[0].x) + " " + str(vertex_[0].y) + " " + str(vertex_[0].z) + "\n")
        for vertex_ in self.vertex:
            file.write("vt " + str(vertex_[1].u/32) + " " + str(1-(vertex_[1].v/32)) + "\n")

        for face in self.faces:
            if n<len(self.switch_materials) and i == self.switch_materials[n][0]:
                file.write("usemtl " + self.switch_materials[n][1] + "\n")
                n += 1
            file.write(f"f {str(face[0]+1)}/{str(face[0]+1)} {str(face[1]+1)}/{str(face[1]+1)} {str(face[2]+1)}/{str(face[2]+1)} \n")
            i += 1
        file.close()
    
    def export_mtl(self):
        if len(self.materials) < 1:
            return
        file = open("obj/" + self.name + ".mtl", "w")
        for material in self.materials:
            file.write(str(material))
    
    def export(self):
        self.export_obj()
        self.export_mtl()
    
    def __str__(self) -> str:
        return "Model(" + self.name + ", " + str(self.vertex) + ", " + str(self.faces) + ")"
    
    def __repr__(self):
        return self.__str__()

def load_course(name="yoshi_valley"):
    if not os.path.isdir("obj"):
        os.mkdir("obj")
    if not os.path.isdir("obj/textures"):
        copytree("textures", "obj/textures")
    if not os.path.isdir("obj/assets"):
        copytree("assets", "obj/assets")
    vertex_set = {}
    course_vertices = open("courses/" + name + "/course_vertices.inc.c", "r").read()
    vertex_set = extract_vertex_file(course_vertices)
    name_course = "d_course_" + name + "_vertex"
    if not name_course in vertex_set:
        print("Error: " + name_course + " not found")
        return
    model_set = {}
    texture_path = load_texture_path(open("data/other_textures.s", "r").read())
    texture_list = load_texture_list(open("src/course_" + name + "_offsets.c", "r").read())
    course_displaylists = open("courses/" + name + "/course_displaylists.inc.c", "r").read()
    for model in re.findall(r"Gfx (\w+)\[\] *=.*\n*\{\n*((?: +g.+\n)+)\}", course_displaylists):
        model_ = Model()
        model_.name = model[0]
        model_.from_file(model[1], vertex_set, model_set, name_course, texture_path, texture_list)
        model_set[model_.name] = model_
        model_.export()
    
    course_data = open("courses/" + name + "/course_data.inc.c", "r").read()
    vertex_set = extract_vertex_file(course_data)
    for variable, path in load_texture_path2(course_data).items():
        texture_path[variable] = path
    for model in re.findall(r"Gfx (\w+)\[\] *=.*\n*\{\n*((?:[ 	]+g.+\n)+)\}", course_data):
        model_ = Model()
        model_.name = model[0]
        model_.from_file(model[1], vertex_set, model_set, name_course, texture_path, texture_list)
        model_set[model_.name] = model_
        model_.export()
    return model_set

if __name__ == "__main__":
    model_set = load_course()
    # export_to_obj_same_file(model_set, vertex_course)
    # export_to_obj(model_set)