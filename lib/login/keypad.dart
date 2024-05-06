import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({super.key, required this.controller});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 1
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
          ],
        ),
        Row(
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
          ],
        ),
        Row(
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
          ],
        ),
        Row(
          children: [
            _buildButton('Clear', onPressed: _clear),
            _buildButton('0'),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
      ],
    );
  }

  // 2
  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: onPressed ?? () => _input(text),
          child: Text(text),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey[300]!),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    String currentText = _controller.text;
    String newText = currentText + text;
    _controller.text = newText;
  }

  void _backspace() {
    _controller.text =
        _controller.text.substring(0, _controller.text.length - 1);
  }

  void _clear() {
    _controller.text = '';
  }

  void main() async {
    _controller.text = '123';
    _backspace();
    expect(_controller.text, '12');

    _input('12');

    expect(_controller.text, '1212');
  }
}
