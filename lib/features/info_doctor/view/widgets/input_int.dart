import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputInt extends StatefulWidget {
  final int? initialValue;
  final ValueChanged<int?>? onChanged;

  const InputInt({Key? key, this.initialValue, this.onChanged})
    : super(key: key);

  @override
  _InputIntState createState() => _InputIntState();
}

class _InputIntState extends State<InputInt> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String text) {
    final int? value = int.tryParse(text);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          border: OutlineInputBorder(),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}
