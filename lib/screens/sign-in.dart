import 'package:chatdoctor/screens/create-data.dart';
import 'package:chatdoctor/screens/doctor-list.dart';
import 'package:chatdoctor/screens/home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/img/icon.png",
                height: 75,
                width: 75,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Masuk dan mulai \nberkonsultasi",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7D8797)),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xffE9E9E9), // Warna border saat tidak fokus
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, // Warna border saat fokus
                          width: 2.0, // Ketebalan border saat fokus
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7D8797)),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(
                              0xffE9E9E9), // Warna border saat tidak fokus
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue, // Warna border saat fokus
                          width: 2.0, // Ketebalan border saat fokus
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      const String hardcodedEmail = 'admin@gmail.com';
                      const String hardcodedPassword = 'admin123';

                      String email = emailController.text;
                      String password = passwordController.text;

                      if (email == hardcodedEmail &&
                          password == hardcodedPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) =>  Home()),
                              (Route<dynamic> route) => false, // Menghapus semua layar sebelumnya
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Wrong credentials'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0BCAD4),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Radius sudut
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      minimumSize: const Size(
                          double.infinity, 50), // Ukuran tombol panjang penuh
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white, // Warna teks
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
