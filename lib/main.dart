import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pfe/Views/Trouver_donneur/ConsulterEtCherherD.dart';
import 'package:pfe/Views/Trouver_donneur/publierAnnonce.dart';
import 'package:pfe/Views/authentification/SignUp.dart';
import 'package:pfe/Views/authentification/dialogueGroupeSanguin.dart';
import 'package:pfe/Views/authentification/logIn.dart';
import 'package:pfe/djangoTest.dart';
import 'package:pfe/dropdownPackage/dropdown.dart';
import 'package:pfe/dropdownPackage/test.dart';
import 'package:pfe/firebase_options.dart';
import 'package:pfe/gestioncompte/gestionCompte.dart';
import 'package:pfe/Views/open.dart';
import 'package:pfe/gestioncompte/gestionannonces.dart';
import 'package:pfe/gestioncompte/infopersonnels.dart';
import 'package:pfe/gestioncompte/signalerProbleme.dart';
import 'package:pfe/graphes.dart';
import 'package:pfe/notificationsTest.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pfe/statistiques/questionnaireDon.dart';
import 'package:pfe/testApimaps.dart';
import 'package:pfe/tools/bottom_navigation_bar.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    print("==================Le titreee Background===============");
    print(message.notification!.title);
    print("data:");
    print(message.data);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  get http => null;

  // addDataDjango(dataAdd, url, suffix) async {
  //   var data = dataAdd;

  //   // Encodez les données au format JSON
  //   var jsonData = jsonEncode(data);

  //   // Remplacez 'http://votre_api_django/endpoint' par l'URL de votre endpoint Django
  //   var response = await http.post(
  //     Uri.parse(url + suffix),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonData,
  //   );
  //   print(Uri.parse(url + suffix));
  //   var jsonresponse = json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     // Réponse réussie
  //     print('Données postées avec succès');
  //     print("===========message from backend=========");
  //     print(jsonresponse["message"]);
  //   } else {
  //     // Gestion des erreurs
  //     print(
  //         'Erreur lors de la publication des données: ${response.statusCode}');
  //     print("===========message from backend=========");
  //     print(jsonresponse["message"]);
  //   }
  // }

  final GlobalKey<ScaffoldMessengerState>
      _scaffoldMessengerKey = //il est créé pour l'arriver de notification forground pour pouvoir l'afficher
      GlobalKey<ScaffoldMessengerState>();
  bool? auth;
  String? groupeS;

  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.medical_services,
              color: Colors.red,
            ),
            Text(
              '  Vous avez reçu une demande de Sang! ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              print("gestion de demande");
            },
            color: Colors.red,
            iconSize: 30,
            icon: Icon(Icons.mail_outlined))
      ],
    ),
    backgroundColor: Colors.grey[300],
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
  );
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "================une notification fourground est arrivé ==================");
      if (message.notification != null) {
        print("Contenue :");
        print("title : ${message.notification!.title}");
        print("body : ${message.notification!.body}");
        print("data:");
        print(message.data);

        _scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      routes: {
        "login": (context) => LogIn(),
        "signup": (context) => SignUp(),
        "informations perso": (context) => Infoperso(),
        "annonces perso": (context) => GestionAnnonce(),
        "profil": (context) => Profil(),
        "questionnaire": (context) => QuestionnaireDon(),
        "main": (context) => const MyApp(),
        "homepage": (context) => Bottom_navigation_bar(),
      },
      theme: ThemeData(
        fontFamily: "AcherusFeral",
      ),
      // home: FirebaseAuth.instance.currentUser != null ? Profil() : Open(),
      home: Open(),
    );
  }
}
