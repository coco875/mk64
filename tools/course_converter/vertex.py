import re

class Point:
    x: int
    y: int
    z: int
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z
    
    def __str__(self) -> str:
        return "Point(" + str(self.x) + ", " + str(self.y) + ", " + str(self.z) + ")"
    
    def __repr__(self):
        return self.__str__()

class UV:
    u: int
    v: int
    def __init__(self, u, v):
        self.u = u
        self.v = v
    
    def __str__(self) -> str:
        return "UV(" + str(self.u) + ", " + str(self.v) + ")"
    
    def __repr__(self):
        return self.__str__()

class Color:
    r: int
    g: int
    b: int
    a: int
    def __init__(self, r, g, b, a):
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    
    def __str__(self) -> str:
        return "Color(" + str(self.r) + ", " + str(self.g) + ", " + str(self.b) + ", " + str(self.a) + ")"
    
    def __repr__(self):
        return self.__str__()

class Vertex:
    vertex: list[tuple[Point, UV, Color]]
    type_: str

    def __init__(self, type_=None, vertex_=None):
        self.type_ = type_ if type_ != None else ""
        self.vertex = vertex_ if vertex_ != None else []
    
    def from_file(self, vertex_str:str):
        for vertex_ in re.findall(r" *\{\{+ *([-.\d]+), *([-.\d]+), *([-.\d]+) *\}, *(?:\d+,)* *\{ *([-.\d]+), *([-.\d]+) *\}, *\{ *(\w+), *(\w+), *(\w+), *(\w+) *\}.+\n", vertex_str):
            self.vertex.append((
                Point(int(vertex_[0]), int(vertex_[1]), int(vertex_[2])), 
                UV(int(vertex_[3])>>5, int(vertex_[4])>>5), 
                Color(int(vertex_[5], base=16), int(vertex_[6], base=16), int(vertex_[7], base=16), int(vertex_[8], base=16))))
    
    def append(self, vertex:list[Point]):
        if type(vertex)==Point:
            self.vertex.append(vertex)
            return
        for v in vertex:
            self.vertex.append(v)
    
    def __str__(self):
        return "Vertex(" + str(self.vertex) + ")"
    
    def __repr__(self):
        return self.__str__()
    
    def __getitem__(self, key):
        return self.vertex[key]
    
    def __setitem__(self, key, value):
        self.vertex[key] = value
    
    def __iter__(self):
        return iter(self.vertex)

    def __len__(self):
        return len(self.vertex)

def extract_vertex_file(file: str):
    vertex_set:dict[Vertex] = {}
    for type_, name, data in re.findall(r"(.*)Vtx (\w+)\[\d*\] *= *\{\n*((?: *\{\{+ *[-\d]+, *[-\d]+, *[-\d]+ *\}.+\n*)+)", file):
        vertex = Vertex(type_)
        vertex.from_file(data)
        vertex_set[name] = vertex
    return vertex_set

if __name__ == "__main__":
    v = extract_vertex_file(open("courses/banshee_boardwalk/course_data.inc.c", "r").read())
    print(v["d_course_banshee_boardwalk_cheep_cheep10"])
    print(len(v["d_course_banshee_boardwalk_cheep_cheep10"]))
    v["d_course_banshee_boardwalk_cheep_cheep10"].append(v["d_course_banshee_boardwalk_cheep_cheep10"][0])
    print(len(v["d_course_banshee_boardwalk_cheep_cheep10"]))