import 'package:flutter/material.dart';
import 'package:app_mobile_clinica_medica/features/filter/view/filtro_page.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  int filtrosAplicados = 0;

  void _abrirFiltros() async {
    final resultado = await showModalBottomSheet<Map<String, String?>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const FiltroPage(),
    );

    int quantidade = 0;

    if (resultado != null) {
      resultado.forEach((key, value) {
        if (value != null && value.trim().isNotEmpty) {
          quantidade++;
        }
      });
    }

    setState(() {
      filtrosAplicados = quantidade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText:
                    filtrosAplicados > 0
                        ? '$filtrosAplicados filtro${filtrosAplicados > 1 ? 's' : ''} aplicado${filtrosAplicados > 1 ? 's' : ''}'
                        : 'Nenhum filtro aplicado',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF0089FF)),
            onPressed: _abrirFiltros,
          ),
        ],
      ),
    );
  }
}
