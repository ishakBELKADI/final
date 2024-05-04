import 'utilisateur.dart';

class Donneur {
  Utilisateur utilisateur;
  String statu;
  DateTime? dateDernierDon;

  Donneur({
    required this.utilisateur,
    required this.statu,
    this.dateDernierDon,
  });

  factory Donneur.fromJson(Map<String, dynamic> json) {
    return Donneur(
      utilisateur: Utilisateur.fromJson(json['utilisateur']),
      statu: json['statu'],
      dateDernierDon: json['date_dernier_don'] != null
          ? DateTime.parse(json['date_dernier_don'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'utilisateur': utilisateur.toJson(),
      'statu': statu,
      'date_dernier_don': dateDernierDon?.toIso8601String(),
    };
  }
}
