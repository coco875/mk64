import re
from vertex import Vertex, extract_vertex_file
from texture import load_texture_list, load_texture_path, link_texture

class Model:
    vertex: Vertex
    faces: list[int]
    name: str
    texture_path: str

    def __init__(self) -> None:
        self.vertex = Vertex()
        self.faces = []
        self.name = ""
    
    def from_file(self, model_str:str, vertex_set:dict[Vertex] = {}, model_set = {}, default="", texture_link = {}):
        offset = 0
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
                # case "gsSPDisplayList":
                #     offset = len(self.vertex)
                #     self.vertex.append(model_set[args[0]].vertex)
                #     for f in model_set[args[0]].faces:
                #         self.faces.append([f[0]+offset, f[1]+offset, f[2]+offset])
    
    def export_obj(self):
        if len(self.vertex) < 1:
            return
        file = open("obj/" + self.name + ".obj", "w")
        file.write("o " + self.name + "\n")
        for vertex_ in self.vertex:
            file.write("v " + str(vertex_[0].x) + " " + str(vertex_[0].y) + " " + str(vertex_[0].z) + "\n")
        for face in self.faces:
            file.write("f " + str(face[0]+1) + " " + str(face[1]+1) + " " + str(face[2]+1) + "\n")
        file.close()

def load_course(name="banshee_boardwalk"):
    vertex_set = {}
    course_vertices = open("courses/" + name + "/course_vertices.inc.c", "r").read()
    vertex_set = extract_vertex_file(course_vertices)
    name_course = "d_course_" + name + "_vertex"
    if not name_course in vertex_set:
        print("Error: " + name_course + " not found")
        return
    model_set = {}
    texture_path = load_texture_path(open("data/other_textures.s", "r").read())
    course_displaylists = open("courses/" + name + "/course_displaylists.inc.c", "r").read()
    for model in re.findall(r"Gfx (\w+)\[\] *=.*\n*\{\n*((?: +g.+\n)+)\}", course_displaylists):
        texture_list = load_texture_list(open("src/course_" + name + "_offsets.c", "r").read())
        texture_link = link_texture(texture_list, texture_path)
        model_ = Model()
        model_.name = model[0]
        model_.from_file(model[1], vertex_set, model_set, name_course, texture_link)
        model_set[model_.name] = model_
        model_.export_obj()
    return model_set

if __name__ == "__main__":
    model_set = load_course()
    print(model_set)
    # export_to_obj_same_file(model_set, vertex_course)
    # export_to_obj(model_set)