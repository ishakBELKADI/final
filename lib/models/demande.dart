import 'donneur.dart';
import 'utilisateur.dart';

class Demande {
  Donneur donneurDest;
  DateTime dateDeDemande;
  Utilisateur utilisateurSrc;
  String typeDemande;
  String etatDemande;

  Demande({
    required this.donneurDest,
    required this.dateDeDemande,
    required this.utilisateurSrc,
    required this.typeDemande,
    required this.etatDemande,
  });

  factory Demande.fromJson(Map<String, dynamic> json) {
    return Demande(
      donneurDest: Donneur.fromJson(json['donneur_dest']),
      dateDeDemande: DateTime.parse(json['date_de_demande']),
      utilisateurSrc: Utilisateur.fromJson(json['utilisateur_src']),
      typeDemande: json['type_demande'],
      etatDemande: json['etat_demande'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donneur_dest': donneurDest.toJson(),
      'date_de_demande': dateDeDemande.toIso8601String(),
      'utilisateur_src': utilisateurSrc.toJson(),
      'type_demande': typeDemande,
      'etat_demande': etatDemande,
    };
  }
}
