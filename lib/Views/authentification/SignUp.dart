// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe/Views/authentification/dialogueGroupeSanguin.dart';
import 'package:pfe/compenments/textformfieldA.dart';
import 'package:pfe/dataStructur.dart';
import 'package:pfe/djangoTest.dart';
import 'package:pfe/dropdownPackage/dropdown.dart';
import 'package:pfe/models/donneur.dart';
import 'package:pfe/models/utilisateur.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController wilaya = TextEditingController();
  TextEditingController dairatext = TextEditingController();

  bool obscuretext = true;

  String? typeUser;

  TextEditingController emailAdress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController groupesnguincontroller = TextEditingController();
  TextEditingController numerotel = TextEditingController();

  bool obscuretext2 = true;

  String? validatorfun(String? value) {
    if (value == "") {
      return "le champ est vide !";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color(0xFFDC003C),
        child: ListView(
          children: [
            Container(
              height: 20,
            ),
            Text(
              "inscrivez-vous ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "creer un compte pour continuer",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: const Color.fromARGB(255, 224, 215, 215),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 5,
              color: Colors.white,
            ),
            Container(
              height: 40,
            ),
            Column(
              children: [
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextForm(
                            textEditingController: nom,
                            validator: (p0) {
                              if (p0 == '') {
                                return validatorfun(p0);
                              }
                              if (p0!.contains(RegExp(r'\d'))) {
                                return "le champ ne peut contenir des chiffres";
                              }
                            },
                            label: "Nom",
                            i: Icon(
                              Icons.person,
                              // color: Colors.white,
                            )),
                        Container(
                          height: 30,
                        ),
                        TextForm(
                            textEditingController: prenom,
                            validator: (p0) {
                              if (p0 == '') {
                                return validatorfun(p0);
                              }
                              if (p0!.contains(RegExp(r'\d'))) {
                                return "le champ ne peut contenir des chiffres";
                              }
                            },
                            label: "Prenom",
                            i: Icon(
                              Icons.person,
                              // color: Colors.white,
                            )),
                        Container(
                          height: 30,
                        ),
                        TextForm(
                            textEditingController: numerotel,
                            type: TextInputType.number,
                            validator: (p0) {
                              if (p0 == '') {
                                return validatorfun(p0);
                              }
                              if (p0!.length != 10) {
                                return "taille de numero invalide";
                              }
                            },
                            label: "numéro de telephone",
                            i: Icon(
                              Icons.phone,
                              // color: Colors.white,
                            )),
                        Container(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: GroupeSanguin(),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        setState(() {});
                                        print(v);
                                        groupesnguincontroller.text = v!;

                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Valider",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Color(0xFFDC003C),
                                      textColor: Colors.white,
                                      height: 50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: AbsorbPointer(
                            absorbing:
                                true, // Désactiver l'interaction avec le TextFormField
                            child: TextForm(
                                textEditingController: groupesnguincontroller,
                                validator: (p0) {
                                  return validatorfun(p0);
                                },
                                label: v == null
                                    ? "Groupe sanguin"
                                    : groupesnguincontroller.text,
                                i: Icon(
                                  Icons.bloodtype,
                                  // color: Colors.white,
                                )),
                          ),
                        ),
                        Container(
                          height: 30,
                        ),
                        AppTextField(
                            validator: (p0) {
                              if (p0 == "") return validatorfun(p0);
                            },
                            textEditingController: wilaya,
                            icon: Icons.location_on,
                            cities: willaya,
                            hint: "Willaya",
                            isCitySelected: true),
                        Container(
                          height: 30,
                        ),
                        AppTextField(
                            validator: (p0) {
                              if (p0 == "") return validatorfun(p0);
                            },
                            textEditingController: dairatext,
                            icon: Icons.location_city_rounded,
                            cities: dairas,
                            hint: "Daira",
                            isCitySelected: true),
                        Container(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Textapp(
                                contenue: "Voulez vous etre un donneur?",
                                fontzsize: 20,
                                color: Colors.white),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Textapp(
                                    contenue: "Oui",
                                    fontzsize: 20,
                                    color: Colors.white),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "Oui",
                                  groupValue: typeUser,
                                  onChanged: (value) {
                                    typeUser = value;
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Textapp(
                                  contenue: "Non",
                                  fontzsize: 20,
                                  color: Colors.white,
                                ),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "Non",
                                  groupValue: typeUser,
                                  onChanged: (value) {
                                    typeUser = value;
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Textapp(
                                    contenue: "Pas maintenant",
                                    fontzsize: 20,
                                    color: Colors.white),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "Pas maintenant",
                                  groupValue: typeUser,
                                  onChanged: (value) {
                                    typeUser = value;
                                    setState(() {});
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailAdress,
                          validator: (value) {
                            if (value == "") {
                              return validatorfun(value);
                            }
                            if (!value!.contains("@") || !value.contains(".")) {
                              return "l'email forme n'est pas valide";
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.mail,
                              // color: Colors.white,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 30, top: 20, bottom: 20),
                            filled: true,
                            // fillColor: Color(0xFFd20000),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return validatorfun(value);
                            }
                          },
                          controller: password,
                          obscureText: obscuretext,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  obscuretext = !obscuretext;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  // color: Colors.white,
                                )),
                            prefixIcon: Icon(
                              Icons.key,
                              // color: Colors.white,
                            ),
                            hintText: "Mot de passe",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 30, top: 20, bottom: 20),
                            filled: true,
                            // fillColor: Color(0xFFd20000),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return validatorfun(value);
                            }
                            if (password.text != password2.text) {
                              return "mot de passe non confirmé !";
                            }
                          },
                          controller: password2,
                          obscureText: obscuretext2,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  obscuretext2 = !obscuretext2;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  // color: Colors.white,
                                )),
                            prefixIcon: Icon(
                              Icons.key,
                              // color: Colors.white,
                            ),
                            hintText: "Confirmer mot de passe",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 30, top: 20, bottom: 20),
                            filled: true,
                            // fillColor: Color(0xFFd20000),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                        ),
                      ],
                    )),
              ],
            ),
            MaterialButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailAdress.text,
                      password: password.text,
                    );

                    Utilisateur user = Utilisateur(
                        nom: nom.text,
                        prenom: prenom.text,
                        numtel: int.parse(numerotel.text),
                        groupSanguin: groupesnguincontroller.text,
                        willaya: wilaya.text,
                        daira: dairatext.text,
                        email: emailAdress.text.toLowerCase());
                    if (typeUser == "Oui") {
                      //l'utilisateur est un donneur
                      Donneur donneur =
                          Donneur(utilisateur: user, statu: "Apte");
                      print(donneur.toJson());
                      addDataDjango(
                          donneur.toJson(), urlSite, "ajouterDonneur/");
                    } else {
                      //utilisateur simple
                      var response =
                          addDataDjango(user.toJson(), urlSite, 'createUser/');
                    }
                    Navigator.pushNamed(context, "homepage");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'le mot de passe n\'pas fiable',
                        btnCancelOnPress: () {},
                        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        btnOkOnPress: () {},
                      )..show();
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'le compte de ce mail existe déja',
                        btnCancelOnPress: () {},
                        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        btnOkOnPress: () {},
                      )..show();
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {
                  print("error");
                }
              },
              child: Text(
                "Se connecter",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFfffffb),
              textColor: Color(0xFFdc003c),
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              height: 20,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 173, 171, 171),
              textColor: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Se connecter avec google",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "images/google.png",
                    width: 40,
                  )
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("login");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous avez deja un compte? ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Connectez vous",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
