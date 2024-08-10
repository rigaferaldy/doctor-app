import 'package:chatdoctor/model/base-doctor.dart';

import '../model/Doctor.dart';
import '../model/cardiologist.dart';
import '../model/pulmonologist.dart';

BaseDoctor convertToDoctor(Map<String, dynamic> row) {
  String category = row['category'];
  BaseDoctor doctor;

  if (category == 'Pulmonologist') {
    doctor = Pulmonologist()
      ..name = row['name']
      ..age = row['age']
      ..address = row['address'];
  } else if (category == 'Cardiologist') {
    doctor = Cardiologist()
      ..name = row['name']
      ..age = row['age']
      ..address = row['address'];
  } else {
    throw Exception('Unknown category: $category');
  }

  return doctor;
}