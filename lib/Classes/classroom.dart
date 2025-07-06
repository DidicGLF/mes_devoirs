import 'package:flutter/material.dart';

class Classroom {
  int classroomId;
  String name;
  Color color;
  int classroomSize;

  Classroom({
    required this.classroomId,
    required this.name,
    required this.color,
    required this.classroomSize,
  });
}

List<Classroom> getClassroomList() {
  List<Classroom> classroom = [
    Classroom(
      classroomId: 0,
      name: "6ème A",
      color: Colors.blue,
      classroomSize: 22,
    ),
    Classroom(
      classroomId: 1,
      name: "6ème B",
      color: Colors.green,
      classroomSize: 25,
    ),
    Classroom(
      classroomId: 2,
      name: "5ème A",
      color: Colors.red,
      classroomSize: 22,
    ),
    Classroom(
      classroomId: 3,
      name: "5ème B",
      color: Colors.yellow,
      classroomSize: 25,
    ),
    Classroom(
      classroomId: 4,
      name: "4ème A",
      color: Colors.pink,
      classroomSize: 22,
    ),
    Classroom(
      classroomId: 5,
      name: "4ème B",
      color: Colors.purple,
      classroomSize: 25,
    ),
  ];
  return classroom;
}
