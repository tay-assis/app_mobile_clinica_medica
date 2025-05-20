import 'package:flutter/material.dart';

class CustomAutocompleteInput extends StatelessWidget {
  final String title;
  final String label;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String> onChanged;

  const CustomAutocompleteInput({
    super.key,
    required this.title,
    required this.label,
    required this.options,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //final TextEditingController controller = TextEditingController(
    //  text: selectedValue ?? '',
    //);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        const SizedBox(height: 10),
        Autocomplete<String>(
          initialValue: TextEditingValue(text: selectedValue ?? ''),
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return options.where(
              (option) => option.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              ),
            );
          },
          onSelected: onChanged,
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Digite ou selecione $label',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
