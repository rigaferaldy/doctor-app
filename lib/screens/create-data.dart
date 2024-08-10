import 'package:chatdoctor/helper/database-helper.dart';
import 'package:chatdoctor/model/Doctor.dart';
import 'package:chatdoctor/model/base-doctor.dart';
import 'package:chatdoctor/model/pulmonologist.dart';
import 'package:flutter/material.dart';

import '../model/cardiologist.dart';

class CreateData extends StatefulWidget {
  @override
  _CreateDataScreenState createState() => _CreateDataScreenState();
}

class _CreateDataScreenState extends State<CreateData> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? selectedCategory;

  final List<String> categories = [
    'Pulmonologist',
    'Cardiologist',
  ];

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text('Select Category'),
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    selectedCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }

                final doctorName = nameController.text;
                final doctorAge = int.tryParse(ageController.text);
                final doctorAddress = addressController.text;

                BaseDoctor doctor;

                if (selectedCategory == 'Pulmonologist') {
                  doctor = Pulmonologist()
                    ..name = doctorName
                    ..age = doctorAge
                    ..address = doctorAddress;
                } else if (selectedCategory == 'Cardiologist') {
                  doctor = Cardiologist()
                    ..name = doctorName
                    ..age = doctorAge
                    ..address = doctorAddress;
                } else {
                  // Handle the case where no valid category is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a valid category')),
                  );
                  return;
                }

                await dbHelper.insertDoctor(doctor, selectedCategory!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Data saved successfully')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
