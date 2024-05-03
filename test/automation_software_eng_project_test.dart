import 'package:automation_software_flutter_code/payment.dart';
import 'package:automation_software_flutter_code/Order.dart';
import 'package:automation_software_flutter_code/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automation_software_flutter_code/main.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:automation_software_flutter_code/components/main_panel_widget.dart';

void main() async {
  group('All tests of automation_software_eng_project', () {
    test('Test: placeOrder() - should be able to place an order', () async {
      Order instance1 = Order.create(data);
      String x = await instance1.placeOrder(true);
      expect(x, 'Test Success');
      expect(instance1.name, 'JoeBlogs');
    });
  });
}

/*

void main() async {
  final instance = FakeFirebaseFirestore();
  await instance.collection('users').add({
    'username': 'Bob',
  });
  final snapshot = await instance.collection('users').get();
  print(snapshot.docs.first.get('username')); // 'Bob'
}

*/
