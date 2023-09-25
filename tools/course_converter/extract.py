import os
import numpy as np
import re

def load_vertex(chn):
    vertex = {}
    vertex_data = re.findall(r"Vtx (\w+)\[\] = \{\n*((?: *\{\{+ *[-\d]+, *[-\d]+, *[-\d]+\}.+\n*)+)", chn)
    for vertex_set in vertex_data:
        vertex[vertex_set[0]] = []
        for vertex_ in re.findall(r" *\{\{ *([-.\d]+), *([-.\d]+), *([-.\d]+)\},.+\n", vertex_set[1]):
            vertex[vertex_set[0]].append([float(vertex_[0]), float(vertex_[1]), float(vertex_[2])])
    return vertex

def load_model(chn, vertex):
    model = {}
    model_data = re.findall(r"Gfx (\w+)\[\] *=.*\n*\{\n*((?: +g.+\n)+)\}", chn)
    curent_offset = 0
    for model_set in model_data:
        vertex_section = model_set[1].split("gsSPVertex(")[1:]
        for i in range(len(vertex_section)):
            vertex_section[i] = "\n".join(vertex_section[i].split("\n")[1:])
        vertex_name = re.findall(r"gsSPVertex\((\w+), *(\d+)", model_set[1])
        if len(vertex_name) < 1:
            continue
        for i in range(len(vertex_section)):
            
            if vertex_name[i][0].startswith("0x04"):
                # next_offset = int(vertex_name[i][1])
                curent_offset = int(vertex_name[i][0], 16) - 0x04000000
                curent_offset //= 0x10
                if not model_set[0] in model:
                    model[model_set[0]] = [vertex["d_course_rainbow_road_vertex"], []]
            elif not model_set[0] in model:
                model[model_set[0]] = [vertex[vertex_name[i][0]], []]
            for face in re.findall(r" +gsSP1Triangle\(+(\d+), +(\d+), +(\d+), +\d+\),\n", vertex_section[i]):
                model[model_set[0]][1].append([int(face[0])+curent_offset, int(face[1])+curent_offset, int(face[2])+curent_offset])
            for face2 in re.findall(r" +gsSP2Triangles\((\d+), +(\d+), +(\d+), +\d+, +(\d+), +(\d+), +(\d+), +\d+\)", vertex_section[i]):
                model[model_set[0]][1].append([int(face2[0])+curent_offset, int(face2[1])+curent_offset, int(face2[2])+curent_offset])
                model[model_set[0]][1].append([int(face2[3])+curent_offset, int(face2[4])+curent_offset, int(face2[5])+curent_offset])
            if len(model[model_set[0]][1]) < 1:
                del model[model_set[0]]
    
    return model
def export_to_obj(model):
    if not os.path.exists("obj"):
        os.makedirs("obj")
    for model_name, (vertex, faces ) in model.items():
        file = open("obj/" + model_name + ".obj", "w")
        file.write("o " + model_name + "\n")
        for vertex_ in vertex:
            file.write("v " + str(vertex_[0]) + " " + str(vertex_[1]) + " " + str(vertex_[2]) + "\n")
        for face in faces:
            file.write("f " + str(face[0]+1) + " " + str(face[1]+1) + " " + str(face[2]+1) + "\n")
        file.close() 
def export_to_obj_same_file(model,vertex):
    if not os.path.exists("obj"):
        os.makedirs("obj")
    file = open("obj/combined.obj", "w")
    for vertex_ in vertex:
        file.write("v " + str(vertex_[0]) + " " + str(vertex_[1]) + " " + str(vertex_[2]) + "\n")
    for model_name, (vertex, faces ) in model.items():
        file.write("o " + model_name + "\n")
        for face in faces:
            file.write("f " + str(face[0]+1) + " " + str(face[1]+1) + " " + str(face[2]+1) + "\n")
    file.close()
file_name = "courses/rainbow_road/course_vertices.inc.c"
with open(file_name, "r") as f:
    file_contents = f.read()
vertex_course = load_vertex(file_contents)
file_name = "courses/rainbow_road/course_displaylists.inc.c"
with open(file_name, "r") as f:
    file_contents = f.read()
model = load_model(file_contents, vertex_course)
export_to_obj(model)
export_to_obj_same_file(model, vertex_course["d_course_rainbow_road_vertex"])
