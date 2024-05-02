import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Is this a device a staff till or kitchen screen?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Jump to staff till page
                    Navigator.pushReplacementNamed(context, '/staff_till');
                  },
                  child: Text('Staff Till'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Jump tp kitchen page
                    Navigator.pushReplacementNamed(context, '/kitchen');
                  },
                  child: Text('Kitchen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}