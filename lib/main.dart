import 'package:flutter/material.dart';
import 'payment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      home: const PaymentPage(title: 'Your Order'),
    );
  }
}
