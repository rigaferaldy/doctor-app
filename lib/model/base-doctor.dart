import 'package:chatdoctor/model/Doctor.dart';

class BaseDoctor implements Doctor {
   // penggunaan _name didart merupakan private field
   String? _name;
   int? _age;
   String? _address;


   // Getters
   String? get name => _name;
   int? get age => _age;
   String? get address => _address;

   // Setters
   set name(String? newName) {
      _name = newName;
   }

   set age(int? newAge) {
      _age = newAge;
   }

   set address(String? newAddress) {
      _address = newAddress;
   }

  @override
  String? printJob() {
    // TODO: implement printJob
    throw UnimplementedError();
  }
}