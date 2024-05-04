// ignore_for_file: unused_local_variable, prefer_const_constructors, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pfe/compenments/textformfieldA.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => LogInPage();
}

class LogInPage extends State<LogIn> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamed("homepage");
  }

  bool obscuretext = true;
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(
            255, 182, 175, 175), //Color.fromARGB(255, 182, 175, 175)
        child: ListView(
          children: [
            Container(
              height: 20,
            ),
            Text(
              "Se connecter",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Se connecter pour continuer",
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
              height: 60,
            ),
            Icon(
              Icons.bloodtype_rounded,
              color: Color(0xFFDC003C),
              size: 150,
            ),
            Container(
              height: 60,
            ),
            Column(
              children: [
                Form(
                    key: formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailAddress,
                          validator: (value) {
                            if (value == "") {
                              return "le champ vide !";
                            }
                            if (!value!.contains("@") || !value.contains(".")) {
                              return "l'email forme n'est pas valide";
                            }
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
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
                            fillColor: Color(0xFFDC003C),
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
                          controller: password,
                          validator: (value) {
                            if (value == "") {
                              return "le champ vide !";
                            }
                          },
                          obscureText: obscuretext,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  obscuretext = !obscuretext;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                )),
                            counter: InkWell(
                              onTap: () async {
                                if (emailAddress.text == '') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.rightSlide,
                                    title: 'Mot de passe oublié !',
                                    desc:
                                        'Veulliez entrez votre adresse mail pour recupérer le mot de passe',
                                    btnCancelOnPress: () {},
                                    descTextStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    btnOkOnPress: () {},
                                  )..show();
                                } else {
                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: emailAddress.text);
                                    await FirebaseAuth.instance
                                        .setLanguageCode("fr");
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Email envoyé !',
                                      desc:
                                          'Nous avons envoyé un email pour recupérer votre mot de passe',
                                      btnCancelOnPress: () {},
                                      descTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      btnOkOnPress: () {},
                                    )..show();
                                  } catch (e) {
                                    print(
                                        "===================================");
                                    print(e);
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: "L'Email n'existe pas !",
                                      desc: 'Veilliez creez un compte ',
                                      btnCancelOnPress: () {},
                                      descTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      btnOkOnPress: () {},
                                    )..show();
                                  }
                                }
                              },
                              child: Textapp(
                                  contenue: "Mot de passe oublié?",
                                  fontzsize: 16),
                            ),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            labelText: "Mot de passe",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 30, top: 20, bottom: 20),
                            filled: true,
                            fillColor: Color(0xFFDC003C),
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
                if (formstate.currentState!.validate()) {
                  // print(emailAddress.text);
                  // print(password.text);
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailAddress.text, password: password.text);
                    Navigator.of(context).pushNamed("homepage");
                  } on FirebaseAuthException catch (e) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Erreur',
                      desc:
                          'utilisateur n\'existe pas ! ou mot de passe incorrect',
                      btnCancelOnPress: () {},
                      descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      btnOkOnPress: () {},
                    )..show();
                    if (e.code == 'user-not-found') {
                      print("user not found");
                    } else if (e.code == 'wrong-password') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Erreur',
                        desc: 'mot de passe incorrect !',
                        btnCancelOnPress: () {},
                        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        btnOkOnPress: () {},
                      )..show();
                    }
                  }
                }
              },
              child: Text(
                "Se connecter",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              color: Color(0xFFDC003C),
              textColor: Colors.white,
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
              onPressed: () async {
                signInWithGoogle();
              },
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
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("signup");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous etes pas inscris? ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "inscrivez vous ",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
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
