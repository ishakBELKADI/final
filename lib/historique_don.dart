import 'package:flutter/material.dart';

class historique extends StatefulWidget {
  const historique({super.key});

  @override
  State<historique> createState() => _historiqueState();
}

class _historiqueState extends State<historique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 220, 0, 59),
          title: Text(
            "Historique de dons",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 251),
            ),
          )),
      body: Container(
        height: 110,
        child: Center(
          child: Text(
            "Aucun don pour le moment..",
            style: TextStyle(fontSize: 30, color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
