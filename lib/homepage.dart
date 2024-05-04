//import 'package:blood_donation/historique_don.dart';
//import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:blood_donation/Views/Trouver_donneur/publierAnnonce.dart';
//import 'package:blood_donation/annonce_filtre.dart';
import 'package:pfe/djangoTest.dart';
import 'package:pfe/models/annonce.dart';
import 'package:pfe/models/utilisateur.dart';
//import 'package:blood_donation/models/utilisateur.dart';
import 'package:pfe/tools/card_post.dart';
import 'package:pfe/tools/choix_don.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var user;
  Utilisateur? utilisateur;
  String? don;
  List<Annonce> annonces = [];
  currentUser() async {
    user = FirebaseAuth.instance.currentUser;
    print("==============email================");
    String email = user.email;
    print(email);
    var userData = await getOneDataDjango(urlSite, email, 'getUser/');
    utilisateur = Utilisateur.fromJson(userData);
    print(utilisateur!.id);
    print(utilisateur!.nom);
    setState(() {});
  }

  Listannonce() async {
    var Data = await getDataDjango(urlSite, 'getAllAnnounces/');
    annonces = convertirListeAnnonces(Data);

    setState(() {});
  }

  /* void maj_fenetre(context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return choix();
          });
        });
  }  */
  @override
  void initState() {
    super.initState();
    currentUser();
    Listannonce();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 70,
              color: Color.fromARGB(255, 220, 0, 59),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        // maj_fenetre(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return choix(
                                annonces: annonces,
                                utilisateur: utilisateur!,
                              );
                            });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 249, 224, 226),
                      ),
                      child: Text(
                        "Donner sang",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 249, 224, 226),
                      ),
                      child: Text(
                        "Trouver donneur",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
            /* RefreshIndicator(
                onRefresh: () => Listannonce(),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: annonces.length,
                    itemBuilder: (context, i) {
                      return Card_cust(
                        name:
                            "${annonces[i].utilisateur.nom} ${annonces[i].utilisateur.prenom}",
                        blood: annonces[i].groupSanguin,
                        day: annonces[i].dateDeDonMax?.day,
                        month: annonces[i].dateDeDonMax?.month,
                        year: annonces[i].dateDeDonMax?.year,
                        day_p: annonces[i].dateDePublication?.day,
                        month_p: annonces[i].dateDePublication?.month,
                        year_p: annonces[i].dateDePublication?.year,
                        adress: annonces[i].place,
                        numtel: annonces[i].numeroTelephone,
                        description: annonces[i].description,
                      );
                    })), */

            ...List.generate(
              annonces.length,
              (i) {
                return Card_cust(
                  name:
                      "${annonces[i].utilisateur.nom!} ${annonces[i].utilisateur.prenom!}",
                  blood: annonces[i].groupSanguin,
                  day: annonces[i].dateDeDonMax?.day,
                  month: annonces[i].dateDeDonMax?.month,
                  year: annonces[i].dateDeDonMax?.year,
                  day_p: annonces[i].dateDePublication?.day,
                  month_p: annonces[i].dateDePublication?.month,
                  year_p: annonces[i].dateDePublication?.year,
                  adress: annonces[i].place,
                  numtel: annonces[i].numeroTelephone,
                  description: annonces[i].description,
                );
              },
            )

            /*Card_cust(
                name: "maya", blood: "B+", date: "27082002", adress: "alger"), */
            //
          ],
        ),
      ),
    );
  }
}
