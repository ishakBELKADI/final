import 'utilisateur.dart';

class Annonce {
  int? id;
  Utilisateur utilisateur;
  String description;
  String groupSanguin;
  String? place;
  DateTime? dateDePublication;
  DateTime? dateDeDonMax;
  int? numeroTelephone;
  DateTime? dateDeModification;

  Annonce({
    required this.utilisateur,
    required this.description,
    required this.groupSanguin,
    this.dateDePublication,
    this.place,
    this.dateDeDonMax,
    this.numeroTelephone,
    this.dateDeModification,
    this.id,
  });

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
      utilisateur: Utilisateur.fromJson(json['utilisateur']),
      description: json['description'],
      id: json['id'],
      groupSanguin: json['groupSanguin'],
      place: json['place'],
      dateDeDonMax: json['date_de_Don_max'] != null
          ? DateTime.parse(json['date_de_Don_max'])
          : null,
      numeroTelephone: json['numerotelephone'],
      dateDeModification: json['date_de_modification'] != null
          ? DateTime.parse(json['date_de_modification'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'utilisateur': utilisateur.toJson(),
      'description': description,
      'groupSanguin': groupSanguin,
      'place': place,
      'id': id,
      'date_de_Don_max': dateDeDonMax?.toIso8601String(),
      'numerotelephone': numeroTelephone,
      'date_de_modification': dateDeModification?.toIso8601String(),
    };
  }
}

List<Annonce> convertirListeAnnonces(List<dynamic> jsonAnnonces) {
  List<Annonce> annonces = [];
  for (var jsonAnnonce in jsonAnnonces) {
    print(jsonAnnonce['utilisateur']);

    Annonce annonce = Annonce(
      utilisateur: Utilisateur.fromJson(jsonAnnonce['utilisateur']),
      description: jsonAnnonce['description'],
      id: jsonAnnonce['id'],
      groupSanguin: jsonAnnonce['groupSanguin'],
      place: jsonAnnonce['place'],
      dateDePublication: jsonAnnonce['date_de_publication'] != null
          ? DateTime.parse(jsonAnnonce['date_de_publication'])
          : null,
      dateDeDonMax: jsonAnnonce['date_de_Don_max'] != null
          ? DateTime.parse(jsonAnnonce['date_de_Don_max'])
          : null,
      numeroTelephone: jsonAnnonce['numerotelephone'],
      dateDeModification: jsonAnnonce['date_de_modification'] != null
          ? DateTime.parse(jsonAnnonce['date_de_modification'])
          : null,
    );
    annonces.add(annonce);
  }
  return annonces;
}
