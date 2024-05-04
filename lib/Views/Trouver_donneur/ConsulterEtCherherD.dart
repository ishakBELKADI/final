import 'package:flutter/material.dart';
import 'package:pfe/Views/Trouver_donneur/resultatRecharche.dart';

class ConsulterEtchercherDonneur extends StatefulWidget {
  @override
  State<ConsulterEtchercherDonneur> createState() =>
      ConsulterEtchercherDonneurPage();
}

class ConsulterEtchercherDonneurPage extends State<ConsulterEtchercherDonneur> {
  int i = 0;
  List donneurs = [
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
  ];
  bool? b;
  bool demande = false;
  TextEditingController sanguin = TextEditingController();
  TextEditingController ville = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Liste des donneurs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CostumeSearch(),
              );
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Form(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).devicePixelRatio),
                child: TextFormField(
                  controller: ville,
                  decoration: InputDecoration(
                    hintText: "Ville",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon:
                        Icon(Icons.location_city_rounded, color: Colors.black),
                    prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: sanguin,
                  decoration: InputDecoration(
                    hintText: "O+",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.bloodtype, color: Colors.black),
                    prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
          Container(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              showSearch(
                  useRootNavigator: false,
                  context: context,
                  delegate: CostumeSearch(),
                  query: ville.text + " " + sanguin.text);
            },
            child: Text(
              "chercher",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            color: Color(0xFFd20000),
            textColor: Colors.white,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: 30,
          ),
          ...List.generate(
            donneurs.length,
            (index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${donneurs[index]["nom"]} ${donneurs[index]["prenom"]}   ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${donneurs[index]["groupe sanguin"]}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            "${donneurs[index]["etat"]}  ",
                            style: TextStyle(fontSize: 16),
                          ),
                          if (donneurs[index]["etat"] == 'Apte')
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 14,
                            )
                          else
                            Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 14,
                            )
                        ],
                      ),
                      Container(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${donneurs[index]["ville"]}"),
                          MaterialButton(
                            onPressed: () {
                              print(donneurs[index]["etat-demande"]);
                              if (donneurs[index]["etat-demande"] == false) {
                                donneurs[index]["etat-demande"] = true;
                              } else {
                                donneurs[index]["etat-demande"] = false;
                              }
                              setState(() {});
                              print(donneurs[index]["etat-demande"]);

                              if (donneurs[index]["etat-demande"] == true) {
                                print("Envoyer demande");
                                //traitement Envoyer une demande
                              } else {
                                print("Annuler demande");

                                //traitement pour Annuler la demande
                              }
                            },
                            child: Text(
                              donneurs[index]["etat-demande"] == true
                                  ? "Demande envoyé"
                                  : "Envoyer demande",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            color: Color(0xFFd20000),
                            textColor: Colors.white,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CostumeSearch extends SearchDelegate {
  List donneurs = [
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "ishak",
      "groupe sanguin": "O+",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "amin",
      "groupe sanguin": "O-",
      "ville": "Alger",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "belkadi",
      "prenom": "zinou",
      "groupe sanguin": "AB+",
      "ville": "Oran",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
    {
      "nom": "mahar",
      "prenom": "amir",
      "groupe sanguin": "A+",
      "ville": "Annaba",
      "etat": "Apte",
      "demande": "false",
      "etat-demande": false
    },
  ];
  List listfilter = [];
  int? selectionne;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = " ";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Resultat(
      element: donneurs[selectionne!],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectionne = index;
                showResults(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${donneurs[index]["nom"]} ${donneurs[index]["prenom"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${donneurs[index]["groupe sanguin"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${donneurs[index]["etat"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${donneurs[index]["ville"]}"),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: donneurs.length);
    } else {
      if (!query.contains(' ')) {
        listfilter = donneurs
            .where((element) =>
                element["ville"].contains(query) ||
                element["groupe sanguin"].contains(query))
            .toList();
      } else {
        String? ville;
        String? gs;
        List<String> lista = query.split(' ');
        lista.removeWhere(
          (element) => element.contains(' '),
        );
        print(lista);
        ville = lista[0];
        print(ville);
        gs = lista[1];
        listfilter = donneurs
            .where((element) => element["ville"].contains(ville))
            .where((element) => element["groupe sanguin"].contains(gs))
            .toList();
      }
      return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectionne = donneurs.indexOf(listfilter[index]);
                showResults(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${listfilter[index]["nom"]} ${listfilter[index]["prenom"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${listfilter[index]["groupe sanguin"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${listfilter[index]["etat"]}"),
                      Container(
                        height: 7,
                      ),
                      Text("${listfilter[index]["ville"]}"),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listfilter.length);
    }
  }
}
