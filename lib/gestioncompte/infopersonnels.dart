import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe/compenments/textformfieldA.dart';
import 'package:pfe/djangoTest.dart';
import 'package:pfe/models/utilisateur.dart';

class Infoperso extends StatefulWidget {
  final Utilisateur? utilisateur;

  const Infoperso({super.key, this.utilisateur});
  @override
  State<Infoperso> createState() => InfopersoPage();
}

class InfopersoPage extends State<Infoperso> {
  late TextEditingController nom;
  late TextEditingController prenom;
  late TextEditingController wilaya;
  late TextEditingController dairatext;
  late TextEditingController emailAdress;
  late TextEditingController groupesnguincontroller;
  late TextEditingController numtel;

  @override
  void initState() {
    nom = TextEditingController(text: widget.utilisateur!.nom);
    prenom = TextEditingController(text: widget.utilisateur!.prenom);
    wilaya = TextEditingController(text: widget.utilisateur!.willaya);
    dairatext = TextEditingController(text: widget.utilisateur!.daira);
    emailAdress = TextEditingController(text: widget.utilisateur!.email);
    numtel = TextEditingController(text: widget.utilisateur!.numtel.toString());
    groupesnguincontroller =
        TextEditingController(text: widget.utilisateur!.groupSanguin);

    super.initState();
  }

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "informations personnels",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFDC003C),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 30,
            ),
            Text(
              "Consuler ou modifier vos informations ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  // color: const Color.fromARGB(255, 224, 215, 215),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40,
            ),
            Form(
                child: Column(
              children: [
                TextForm(
                    textEditingController: nom,
                    label: "Nom",
                    i: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextForm(
                    textEditingController: prenom,
                    label: "Prenom",
                    i: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextForm(
                    textEditingController: numtel,
                    label: "numero telephone",
                    i: Icon(
                      Icons.phone,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextForm(
                    textEditingController: groupesnguincontroller,
                    label: "groupe sanguin",
                    i: Icon(
                      Icons.bloodtype,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextForm(
                    label: "Willaya",
                    textEditingController: wilaya,
                    i: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextForm(
                    label: "Daira",
                    textEditingController: dairatext,
                    i: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    )),
                Container(
                  height: 30,
                ),
                TextFormField(
                  controller: emailAdress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    filled: true,
                    fillColor: Colors.red,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        )),
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    labelText: "Nouveau Mot de passe",
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 20, bottom: 20),
                    filled: true,
                    fillColor: Colors.red,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     suffixIcon: IconButton(
                //         onPressed: () {},
                //         icon: Icon(
                //           Icons.remove_red_eye,
                //           color: Colors.white,
                //         )),
                //     prefixIcon: Icon(
                //       Icons.key,
                //       color: Colors.white,
                //     ),
                //     labelText: "Confirmer mot de passe",
                //     labelStyle: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //     contentPadding:
                //         EdgeInsets.only(left: 30, top: 20, bottom: 20),
                //     filled: true,
                //     fillColor: Colors.red,
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 2.0, color: Colors.white),
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(width: 2.0, color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            )),
            MaterialButton(
              onPressed: () async {
                Utilisateur user = Utilisateur(
                    nom: nom.text,
                    prenom: prenom.text,
                    numtel: int.parse(numtel.text),
                    groupSanguin: groupesnguincontroller.text,
                    willaya: wilaya.text,
                    daira: dairatext.text,
                    email: emailAdress.text);
                print(user.toJson());

                await updateDataDjango(user.toJson(), urlSite, "updaterUser/",
                    widget.utilisateur!.id.toString());

                if (password.text.isNotEmpty) {
                  var user = FirebaseAuth.instance.currentUser;
                  print(user);
                  await user?.updatePassword(password.text);
                }
                Navigator.of(context).pushReplacementNamed("profil");
              },
              child: Text(
                "Appliquer changement",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFd20000),
              textColor: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}
