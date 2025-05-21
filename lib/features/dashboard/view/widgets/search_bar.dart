import 'package:app_mobile_clinica_medica/features/filter/model/select_filter.dart';
import 'package:app_mobile_clinica_medica/features/shared/widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/filter/view/filter_page.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  int appliedFilters = 0;

  @override
  void initState() {
    super.initState();

    // Check filters in singleton and update conter
    final filtros = SelectedFilter();
    int quantity = 0;
    if (filtros.specialty != null && filtros.specialty!.isNotEmpty) quantity++;
    if (filtros.clinic != null && filtros.clinic!.isNotEmpty) quantity++;
    if (filtros.location != null && filtros.location!.isNotEmpty) quantity++;
    if (filtros.doctorName != null && filtros.doctorName!.isNotEmpty) {
      quantity++;
    }

    setState(() {
      appliedFilters = quantity;
    });
  }

  // Function to open the filter page and get the selected filters
  void _openFilters() async {
    final result = await showModalBottomSheet<Map<String, String?>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const FilterPage(),
    );

    // Update quantity of the filters apply with singleton
    final filtros = SelectedFilter();
    int quantity = 0;
    if (filtros.specialty != null && filtros.specialty!.isNotEmpty) quantity++;
    if (filtros.clinic != null && filtros.clinic!.isNotEmpty) quantity++;
    if (filtros.location != null && filtros.location!.isNotEmpty) quantity++;
    if (filtros.doctorName != null && filtros.doctorName!.isNotEmpty)
      quantity++;

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
            icon: const CircleIcon(
              icon: Icons.tune,
              color: Color(0xFF0089FF),
              backgroundColor: Colors.white,
            ),
            onPressed: _openFilters,
          ),
        ],
      ),
    );
  }
}
