import 'dart:convert';
import 'dart:io';
//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
//import 'package:flutter/widgets.dart';
import 'package:mes_devoirs/Screen/screen_sethomework.dart';
import 'package:path/path.dart' as path;

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

  // Convertir l'objet en Map pour la sérialisation JSON
  Map<String, dynamic> toJson() {
    return {
      'done': done,
      'creationDate': creationDate,
      'deadline': deadline,
      'contenu': contenu,
      'classroomId': classroomId,
    };
  }

  // Créer un objet Homework depuis un Map (désérialisation)
  factory Homework.fromJson(Map<String, dynamic> json) {
    return Homework(
      done: json['done'] ?? false,
      creationDate: json['creationDate'] ?? '',
      deadline: json['deadline'] ?? '',
      contenu: json['contenu'] ?? '',
      classroomId: json['classroomId'] ?? 0,
    );
  }

  // Save Homework List
  static Future<void> saveHomeworkList(
    List<Homework> homeworks,
    String filePath,
  ) async {
    try {
      final file = File(filePath);
      await file.parent.create(recursive: true);

      final jsonList = homeworks.map((homework) => homework.toJson()).toList();
      final jsonString = jsonEncode(jsonList);

      await file.writeAsString(jsonString);
      print('${homeworks.length} devoirs sauvegardés dans: $filePath');
    } catch (e) {
      print('Erreur lors de la sauvegarde de la liste: $e');
    }
  }

  //Load Homework List
  static Future<List<Homework>> loadHomeworkList(String filePath) async {
    try {
      final file = File(filePath);

      if (!await file.exists()) {
        print('Le fichier n\'existe pas: $filePath');
        return [];
      }

      final jsonString = await file.readAsString();
      final jsonList = jsonDecode(jsonString) as List<dynamic>;

      return jsonList
          .map((json) => Homework.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Erreur lors du chargement de la liste: $e');
      return [];
    }
  }

  // Obtenir un chemin de fichier approprié pour Linux
  static String getDefaultFilePath([String? fileName]) {
    final homeDir = Platform.environment['HOME'] ?? '/tmp';
    final appDir = path.join(homeDir, '.config', 'Mes devoirs');
    return path.join(appDir, fileName ?? 'homework.json');
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
