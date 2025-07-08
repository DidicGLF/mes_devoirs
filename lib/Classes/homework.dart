import 'dart:convert';

class Homework {
  bool done;
  String creationDate;
  String deadline;
  String contenu;
  int classroomId;

  Homework({
    required this.done,
    required this.creationDate,
    required this.deadline,
    required this.contenu,
    required this.classroomId,
  });

  Map<String, dynamic> toJson() {
    return {
      'done': done,
      'creationDate': creationDate,
      'deadline': deadline,
      'contenu': contenu,
      'classroomId': classroomId,
    };
  }
}

List<Homework> getHomeworkList() {
  List<Homework> homework = [
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 0,
      done: true,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 1,
      done: false,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 2,
      done: true,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 3,
      done: true,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 4,
      done: true,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroomId: 5,
      done: false,
    ),
  ];
  return homework;
}
