import 'donneur.dart';

class EffectueDon {
  Donneur donneur;
  DateTime dateDeDon;
  String typeDeDon;

  EffectueDon({
    required this.donneur,
    required this.dateDeDon,
    required this.typeDeDon,
  });

  factory EffectueDon.fromJson(Map<String, dynamic> json) {
    return EffectueDon(
      donneur: Donneur.fromJson(json['donneur']),
      dateDeDon: DateTime.parse(json['date_de_don']),
      typeDeDon: json['type_de_don'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donneur': donneur.toJson(),
      'date_de_don': dateDeDon.toIso8601String(),
      'type_de_don': typeDeDon,
    };
  }
}
