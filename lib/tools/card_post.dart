import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Card_cust extends StatelessWidget {
  final String? name, blood, adress, description;
  int? numtel;
  bool? choice;
  void Function()? onPressed;

  final int? year, month, day; //date de don
  final int? year_p, month_p, day_p; //date de publication
  Card_cust({
    //super.key,
    this.choice,
    this.onPressed,
    required this.name,
    required this.blood,
    required this.adress,
    this.numtel,
    this.description,
    this.year,
    this.month,
    this.day,
    this.year_p,
    this.month_p,
    this.day_p,
  });

  void appelerNumero(int numero) async {
    Uri url = Uri.parse('tel:0$numero');
    // if (await canLaunchUrl(url)) {
    await launchUrl(url);
    //} else {
    //throw 'Impossible de lancer $url';
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 241, 230, 231),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "$blood",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 220, 0, 59),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Publié le : $day_p-$month_p-$year_p",
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (description != null) ...[
                  Text(
                    "$description",
                  ),
                ],
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Endroit : $adress",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Date de don : $day-$month-$year",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 0.9,
                      color: Colors
                          .grey), // Ajoute une bordure noire d'épaisseur 1.0
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    // pas de ligne
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 228, 64, 83),
                          ),
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          height: 40,
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.flash_on_outlined,
                                  color: Color.fromARGB(255, 241, 230, 231),
                                  size: 20,
                                )),
                          )),
                      if (numtel != null) ...[
                        IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            // Action à effectuer lors du clic sur l'icône du téléphone
                            appelerNumero(numtel!);
                          },
                        ),
                      ],
                      MaterialButton(
                        color: Color.fromARGB(255, 228, 64, 83),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {},
                        //color: Color.fromARGB(255, 220, 0, 59),
                        child: Text(
                          "demande",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //row tae padding
          ],
        ),
      ),
    );
  }
}
