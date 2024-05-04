import 'package:pfe/tools/card_demande.dart';
import 'package:flutter/material.dart';

class demande extends StatefulWidget {
  const demande({super.key});

  @override
  State<demande> createState() => _demandeState();
}

class _demandeState extends State<demande> {
  List<card_demande> cards = [
    card_demande(
      name: "Brahmi Maya",
      blood: "B+",
      adress: "Cheraga",
      contenu: "Refuser",
      changer: true,
    ),
    card_demande(
      name: "Brahmi Lea",
      blood: "O-",
      adress: "Draria",
      contenu: "Refuser",
      changer: true,
    ),
    card_demande(
      name: "Brahmi Samy",
      blood: "AB+",
      adress: "Staoueli",
      contenu: "Refuser",
      changer: true,
    ),
    card_demande(
      name: "Brahmi Sophia",
      blood: "B-",
      adress: "Bouchaoui",
      contenu: "Refuser",
      changer: true,
    ),
    card_demande(
      name: "Brahmi zaki",
      blood: "A+",
      adress: "Delly Brahim",
      contenu: "Refuser",
      changer: true,
    ),
    card_demande(
      name: "Brahmi Adam",
      blood: "H",
      adress: "Benaknoun",
      contenu: "Refuser",
      changer: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Changez cette couleur selon vos besoins
        ),
        backgroundColor: Color.fromARGB(255, 220, 0, 59),
        title: Text(
          "Les demandes",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 251),
          ),
        ),
      ),
      body: cards.isEmpty
          ? Center(
              child: Text(
              'Aucune demande',
              style: TextStyle(fontSize: 30, color: Colors.grey[600]),
            ))
          : ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return card_demande(
                  name: cards[index].name,
                  blood: cards[index].blood,
                  adress: cards[index].adress,
                  contenu: cards[index].contenu,
                  changer: cards[index].changer,
                  accepted: () {
                    setState(() {
                      // Si la carte est acceptée, toutes les autres cartes sont supprimées
                      cards[index].contenu = "annuler";
                      //cards.removeWhere((card) => card != cards[index]);

                      setState(() {
                        cards[index].changer = false;
                      });
                    });
                  },
                  refused: () {
                    setState(() {
                      // Si la carte est refusée, elle est supprimée de la liste
                      cards.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
}
