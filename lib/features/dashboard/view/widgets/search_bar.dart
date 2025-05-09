import 'package:app_mobile_clinica_medica/features/dashboard/view/widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/filter/view/filter_page.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  int appliedFilters = 0;

  // Function to open the filter page and get the selected filters
  void _openFilters() async {
    final result = await showModalBottomSheet<Map<String, String?>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const FilterPage(),
    );

    int quantity = 0;

    // Check if the result is not null and count the number of applied filters
    if (result != null) {
      result.forEach((key, value) {
        if (value != null && value.trim().isNotEmpty) {
          quantity++;
        }
      });
    }

    // Update the state with the number of applied filters
    setState(() {
      appliedFilters = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container with text field and filter icon
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // Text field to display the number of applied filters
              decoration: InputDecoration(
                // Logic input decoration to show the number of applied filters
                hintText:
                    appliedFilters > 0
                        ? '$appliedFilters filtro${appliedFilters > 1 ? 's' : ''} aplicados'
                        : 'Nenhum filtro aplicado',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            // Icon to open the filter page
            icon: const CircleIcon(icon: Icons.tune, color: Color(0xFF0089FF)),
            onPressed: _openFilters,
          ),
        ],
      ),
    );
  }
}
