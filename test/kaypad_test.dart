import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:automation_software_flutter_code/login/keypad.dart';

void main() {
  group('NumericKeypad Widget Tests', () {
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
  });
}
