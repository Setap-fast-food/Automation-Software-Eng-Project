import 'package:flutter/material.dart';
import 'home_page_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Define your app's theme here
      ),
      home: HomePageWidget(),
    );
  }
}
