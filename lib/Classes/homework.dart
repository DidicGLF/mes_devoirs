import 'dart:convert';
import 'dart:io';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

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
