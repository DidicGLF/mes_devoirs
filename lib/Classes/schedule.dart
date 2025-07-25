class Creneau {
  final String jour;
  final String periode;
  String? classe;
  String? salle;

  Creneau({required this.jour, required this.periode, this.classe, this.salle});

  bool get estVide => classe == null || salle == null;

  Map<String, dynamic> toJson() => {
    'jour': jour,
    'periode': periode,
    'classe': classe,
    'salle': salle,
  };

  factory Creneau.fromJson(Map<String, dynamic> json) => Creneau(
    jour: json['jour'],
    periode: json['periode'],
    classe: json['classe'],
    salle: json['salle'],
  );
}
