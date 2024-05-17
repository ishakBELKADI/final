import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pfe/djangoTest.dart';
import 'package:pfe/formulaire_don.dart';
import 'package:pfe/models/utilisateur.dart';

class historique extends StatefulWidget {
  final Utilisateur? utilisateur;
  const historique({super.key, this.utilisateur});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  bool waiting = true;
  List? donsUser;
  getDonuser() async {
    donsUser = await getDataDjango(
        urlSite, 'recupererDonUser/${widget.utilisateur!.id}');
    print(donsUser);
    waiting = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDonuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DonHistoryForm(
                  utilisateur: widget.utilisateur,
                );
              },
            ).then((value) {
              setState(() {});
              if (donfait != null && donfait == 'fait') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Don effectué',
                  desc: 'Don effectué avec succès !',
                  btnCancelOnPress: () {},
                  descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  btnOkOnPress: () {
                    // Afficher le deuxième dialogue ici si nécessaire
                  },
                )..show();
              }
              if (donfait != null && donfait == 'nonfait') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Don Non effectué',
                  desc:
                      'vous ne pouvez pas effectuer plusieurs dons à la même date',
                  btnCancelOnPress: () {},
                  descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  btnOkOnPress: () {
                    // Afficher le deuxième dialogue ici si nécessaire
                  },
                )..show();
              }
              getDonuser();
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 218, 52, 96),
          //Color.fromARGB(255, 249, 202, 213),
          elevation: 5,
          splashColor: Color.fromARGB(255, 250, 181, 197),
        ),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 220, 0, 59),
            title: Text(
              "Historique de dons",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 251),
              ),
            )),
        body: waiting == false
            ? ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          height: 10,
                        ),
                      ),
                      Container(
                          child: Text(
                              "Nombre de dons total : ${donsUser!.length}")),
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(donsUser!.length, (index) {
                    return Card(
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "date de don : ",
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  donsUser![index]["date_de_don"],
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 220, 0, 59)),
                                ),
                                PopupMenuButton(
                                  onSelected: (value) async {
                                    if (value == 'supp') {
                                      var response = await deleteDataDjango(
                                          urlSite,
                                          'deleteDon/${widget.utilisateur!.id}/${donsUser![index]["date_de_don"]}');
                                      if (response["message"] ==
                                          "Don supprimé") {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.info,
                                          animType: AnimType.rightSlide,
                                          title: 'Un don est supprimé',
                                          desc: 'vous avez supprimé un don',
                                          btnCancelOnPress: () {},
                                          descTextStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          btnOkOnPress: () {
                                            // Afficher le deuxième dialogue ici si nécessaire
                                          },
                                        )..show();
                                        donsUser!.removeAt(index);
                                        setState(() {});
                                      }
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: Text("Supprimer le don"),
                                        value: 'supp',
                                      )
                                    ];
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "type de don : ",
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(donsUser![index]["type_de_don"],
                                    style: TextStyle(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 220, 0, 59))),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "quantité : ",
                                  style: TextStyle(
                                      fontSize: 17.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("ff",
                                    style: TextStyle(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 220, 0, 59))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
