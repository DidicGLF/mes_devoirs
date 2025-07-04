class Homework {
  bool done;
  String creationDate;
  String deadline;
  String contenu;
  String classroom;

  Homework({
    required this.done,
    required this.creationDate,
    required this.deadline,
    required this.contenu,
    required this.classroom,
  });
}

List<Homework> getHomeworkList() {
  // TODO: implement populateHomeworkList
  List<Homework> homework = [
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroom: "6A",
      done: true,
    ),
    Homework(
      creationDate: "29 juin 2025",
      deadline: "30 juin 2025",
      contenu: "Réviser sa leçon sur les triangles",
      classroom: "6A",
      done: false,
    ),
  ];
  return homework;
}
