import 'package:flutter/material.dart';

class Resultat extends StatefulWidget {
  final element;

  Resultat({super.key, this.element});
  @override
  State<Resultat> createState() => ResultatPage();
}

class ResultatPage extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
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
                  "${widget.element["nom"]} ${widget.element["prenom"]}   ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${widget.element["groupe sanguin"]}",
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
                  "${widget.element["etat"]}  ",
                  style: TextStyle(fontSize: 16),
                ),
                if (widget.element["etat"] == 'Apte')
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
                Text("${widget.element["ville"]}"),
                MaterialButton(
                  onPressed: () {
                    print(widget.element["etat-demande"]);
                    if (widget.element["etat-demande"] == false) {
                      widget.element["etat-demande"] = true;
                    } else {
                      widget.element["etat-demande"] = false;
                    }
                    setState(() {});
                    print(widget.element["etat-demande"]);

                    if (widget.element["etat-demande"] == true) {
                      print("Envoyer demande");
                      //traitement Envoyer une demande
                    } else {
                      print("Annuler demande");

                      //traitement pour Annuler la demande
                    }
                  },
                  child: Text(
                    widget.element["etat-demande"] == true
                        ? "Demande envoyé"
                        : "Envoyer demande",
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
          ],
        ),
      ),
    );
  }
}
