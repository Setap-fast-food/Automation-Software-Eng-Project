import 'package:automation_software_flutter_code/welcome_page.dart';
import 'package:flutter/material.dart';
import 'payment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login/login.dart';

void main() async {
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.android, // if you're using windows emulator
    //options: DefaultFirebaseOptions.ios, // if you're using windows emulator
    options: DefaultFirebaseOptions.web, // for web
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // 233 215 255
          primaryColor: const Color.fromRGBO(151, 71, 255, 1),
          // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(151, 71, 255, 1)),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const WelcomePage(title: "Scenario Selection"),
          '/staff_till': (context) => const PaymentPage(title: "Your Order"),
          '/kitchen': (context) => const LoginPage(title: "Login")
        });
  }
}
