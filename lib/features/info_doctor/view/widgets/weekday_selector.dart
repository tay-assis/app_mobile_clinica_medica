import 'package:flutter/material.dart';

  // selects weekdays and returns as a list that DoctorSchedule can use
class WeekdaySelector extends StatefulWidget {
  /// Day codes must be one of these:
  static const _dayCodes = ["SUN","MON","TUE","WED","THU","FRI","SAT"];

  final List<String>? initialSelected;
  final ValueChanged<List<String>> onChanged;

  const WeekdaySelector({
    Key? key,
    this.initialSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  _WeekdaySelectorState createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    // initialize selection from initialSelected (if any)
    final init = widget.initialSelected ?? [];
    _isSelected = WeekdaySelector._dayCodes
        .map((code) => init.contains(code))
        .toList();
  }

  void _onButtonPressed(int index) {
    setState(() {
      _isSelected[index] = !_isSelected[index];
    });
    // collect all the selected codes and callback
    final selected = <String>[];
    for (var i = 0; i < _isSelected.length; i++) {
      if (_isSelected[i]) selected.add(WeekdaySelector._dayCodes[i]);
    }
    widget.onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      onPressed: _onButtonPressed,
      borderRadius: BorderRadius.circular(8),
      selectedBorderColor: Theme.of(context).primaryColor,
      selectedColor: Colors.white,
      fillColor: Theme.of(context).primaryColor,
      color: Colors.black87,
      constraints: const BoxConstraints(minWidth: 40, minHeight: 36),
      children: WeekdaySelector._dayCodes.map((code) {
        return Text(code, style: const TextStyle(fontSize: 12));
      }).toList(),
    );
  }
}