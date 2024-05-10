import 'package:flutter/material.dart';
import 'package:pfe/formulaire_don.dart';

class historique extends StatefulWidget {
  const historique({super.key});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DonHistoryForm();
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
      body: Column(
        children: [],
      ),
    );
  }
}
