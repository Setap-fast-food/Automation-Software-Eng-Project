import 'package:automation_software_flutter_code/login/keypad.dart';
import 'package:automation_software_flutter_code/payment.dart';
import 'package:automation_software_flutter_code/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automation_software_flutter_code/login/login.dart';
import 'package:automation_software_flutter_code/home_page_widget.dart';
import 'package:automation_software_flutter_code/Item.dart';

void main() async {
  group('Method/Class Tests', () {
    test('placeOrder() Functionality', () async {
      Order instance1 = Order.create(data);
      // due to not being able to test on a live database, the
      // only way to test is to run the code on a mock database
      // and make sure it doesn't throw errors when executing the code
      String x = await instance1.placeOrder(true, 'JoeBlogs');
      expect(x, 'Test Success');
    });

    test('Item.create() - Initialisation Test', () {
      const name = 'Food1';
      const url =
          'https://pic1.zhimg.com/v2-36f3a88e38fbb666f7499970ee352c30_r.jpg';
      const describe = 'food1 description';
      const price = 2.5;
      const number = 1;

      final item = Item.create(name, url, describe, price, number);

      expect(item.name, equals(name));
      expect(item.url, equals(url));
      expect(item.describe, equals(describe));
      expect(item.price, equals(price));
      expect(item.number, equals(number));
      expect(item.subtotal, equals(price * number));
    });

    test('getSubtotal Method Test', () {
      final price = 2.5;
      final number = 3;
      final item = Item.create(
          'Food1',
          'https://pic1.zhimg.com/v2-36f3a88e38fbb666f7499970ee352c30_r.jpg',
          'food1 description',
          price,
          number);

      final calculatedSubtotal = item.getSubtotal();

      expect(calculatedSubtotal, equals(price * number));
    });
  });

  group('Widget Tests', () {
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

    testWidgets('Initialisation Test', (WidgetTester tester) async {
      // Create a controller
      TextEditingController controller = TextEditingController();

      // Build the NumericKeypad widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NumericKeypad(controller: controller),
          ),
        ),
      );

      // Verify that the widget initialises with the correct controller
      expect(controller.text, isEmpty);
    });

    testWidgets('Button Press Test', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NumericKeypad(controller: controller),
          ),
        ),
      );

      // Find and tap the button with text '1'
      await tester.tap(find.text('1'));
      await tester.pump();

      // Verify that the controller's text is updated
      expect(controller.text, equals('1'));

      // Find and tap the button with text '2'
      await tester.tap(find.text('2'));
      await tester.pump();

      // Verify that the controller's text is updated
      expect(controller.text, equals('12'));

      // Find and tap the 'Clear' button
      await tester.tap(find.text('Clear'));
      await tester.pump();

      // Verify that the controller's text is cleared
      expect(controller.text, isEmpty);
    });

    testWidgets('Backspace Test', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();
      controller.text = '12345';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NumericKeypad(controller: controller),
          ),
        ),
      );

      // Find and tap the backspace button (⌫)
      await tester.tap(find.text('⌫'));
      await tester.pump();

      // Verify that the last character is removed
      expect(controller.text, equals('1234'));
    });

    testWidgets('Rendering Test', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NumericKeypad(controller: controller),
          ),
        ),
      );

      // Verify that all numeric buttons and action buttons (Clear and Backspace) exist
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('6'), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('9'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('Clear'), findsOneWidget);
      expect(find.text('⌫'), findsOneWidget);
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
  });
}
