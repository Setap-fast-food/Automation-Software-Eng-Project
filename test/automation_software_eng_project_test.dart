import 'package:automation_software_flutter_code/payment.dart';
import 'package:automation_software_flutter_code/Order.dart';
import 'package:flutter_test/flutter_test.dart';

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
