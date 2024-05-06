import 'package:automation_software_flutter_code/login/keypad.dart';
import 'package:automation_software_flutter_code/payment.dart';
import 'package:automation_software_flutter_code/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automation_software_flutter_code/login/login.dart';
import 'package:automation_software_flutter_code/home_page_widget.dart';

void main() async {
  test('placeOrder() Functionality', () async {
    Order instance1 = Order.create(data);
    // due to not being able to test on a live database, the
    // only way to test is to run the code on a mock database
    // and make sure it doesn't throw errors when executing the code
    String x = await instance1.placeOrder(true);
    expect(x, 'Test Success');
    expect(instance1.name, 'JoeBlogs');
  });

  testWidgets('Clear Button Functionality', (WidgetTester tester) async {
    TextEditingController controller1 = TextEditingController();
    controller1.text = '135';

    await tester.pumpWidget(MaterialApp(
      home: NumericKeypad(controller: controller1),
    ));

    expect(controller1.text, '135');
    final clearButtonFinder = find.byKey(clearButtonKey);

    await tester.tap(clearButtonFinder);

    expect(controller1.text, '');
  });

  testWidgets('FFButtonWidget() (Login Button) Functionality',
      (WidgetTester tester) async {
    final TextEditingController mockController = TextEditingController();
    mockController.text = '1234';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: LoginPage(title: 'Test'),
      ),
    ));

    final Finder loginButton = find.byKey(LoginPage.loginButtonKey);

    await tester.tap(loginButton);

    expect(find.byType(HomePageWidget), findsOneWidget);
  });
}
