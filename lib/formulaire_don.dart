import 'package:flutter/material.dart';

class DonHistoryForm extends StatefulWidget {
  @override
  _DonHistoryFormState createState() => _DonHistoryFormState();
}

class _DonHistoryFormState extends State<DonHistoryForm> {
  String _selectedDonationType = 'Sang';
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //title: Text('Ajouter un Don'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Color.fromARGB(255, 220, 0, 59),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Date de Don :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 220, 0, 59),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.bloodtype_outlined,
                  color: Color.fromARGB(255, 220, 0, 59),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Type de Don :',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 220, 0, 59),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            RadioListTile(
              activeColor: Color.fromARGB(255, 220, 0, 59),
              title: Text('Sang'),
              value: 'Sang',
              groupValue: _selectedDonationType,
              onChanged: (String? value) {
                setState(() {
                  _selectedDonationType = value!;
                });
              },
            ),
            RadioListTile(
              title: Text(
                'Plaquette',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              activeColor: Color.fromARGB(255, 220, 0, 59),
              value: 'Plaquette',
              groupValue: _selectedDonationType,
              onChanged: (String? value) {
                setState(() {
                  _selectedDonationType = value!;
                });
              },
            ),
            RadioListTile(
              title: Text('Plasma'),
              activeColor: Color.fromARGB(255, 220, 0, 59),
              value: 'Plasma',
              groupValue: _selectedDonationType,
              onChanged: (String? value) {
                setState(() {
                  _selectedDonationType = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ajouter',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
