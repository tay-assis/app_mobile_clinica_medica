import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          FocusScope.of(
            context,
          ).unfocus(); // Fecha o teclado se algum campo tiver o foco
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: value,
            hint: Text('Selecione $label'),
            items:
                items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
            onChanged: (val) {
              FocusScope.of(
                context,
              ).unfocus(); // Fecha o teclado mesmo ao selecionar
              onChanged(val);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              hintStyle: TextStyle(color: Colors.blue.shade700),
              labelStyle: TextStyle(color: Colors.blue.shade800),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            iconEnabledColor: Colors.blue, // seta azul
            dropdownColor: Colors.blue[50], // cor de fundo do menu
          ),
        ],
      ),
    );
  }
}
