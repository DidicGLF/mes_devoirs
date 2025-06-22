class Devoir {
  String id;
  String titre;
  String contenu;
  DateTime dateCreation;
  DateTime dateEcheance;
  String classeId;

  Devoir({
    required this.id,
    required this.titre,
    required this.contenu,
    required this.dateCreation,
    required this.dateEcheance,
    required this.classeId,
  });
}
