import 'package:automation_software_flutter_code/login/keypad.dart';
import 'package:automation_software_flutter_code/payment.dart';
import 'package:automation_software_flutter_code/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('placeOrder() functionality', () async {
    Order instance1 = Order.create(data);
    // due to not being able to test on a live database, the
    // only way to test is to run the code on a mock database
    // and make sure it doesnt throw errors when executing the code
    String x = await instance1.placeOrder(true);
    expect(x, 'Test Success');
    expect(instance1.name, 'JoeBlogs');
  });

  testWidgets('Clear Button Functionality', (WidgetTester tester) async {
    final controller = TextEditingController();
    controller.text = '135';

    await tester.pumpWidget(MaterialApp(
      home: NumericKeypad(controller: controller),
    ));

    expect(controller.text, '135');
    final clearButtonFinder = find.byKey(clearButtonKey);

    await tester.tap(clearButtonFinder);

    expect(controller.text, '');
  });
}
