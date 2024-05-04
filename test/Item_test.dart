import 'package:flutter_test/flutter_test.dart';
import 'package:automation_software_flutter_code/Item.dart';

void main() {
  group('Item Class Tests', () {
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
}
