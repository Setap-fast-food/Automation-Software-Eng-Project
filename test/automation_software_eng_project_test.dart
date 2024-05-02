import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

class automation_software_eng_project {
  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }

  int multiply(int a, int b) {
    return a * b;
  }
}

void main() {
  group('Test all methods of automation_software_eng_project', () {
    test('Test add 2 positive integers', () {
      automation_software_eng_project math = automation_software_eng_project();
      expect(math.add(0, 3), equals(3));
    });
    test('Test add 2 negative integers', () {
      automation_software_eng_project math = automation_software_eng_project();
      expect(math.add(-1, -3), equals(-4));
    });
  });
}
