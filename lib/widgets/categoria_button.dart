import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/screens/list_revenue_screen.dart';

class CategoriaButton extends StatelessWidget {
  final List<Categories> categorias;

  const CategoriaButton({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10.0, 
        children: categorias.map((categoria) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ListRevenueScreen(endpoint: categoria.strCategory ?? ''),
                ),
              );
            },
            child: Chip(
              backgroundColor: const Color.fromARGB(255, 255, 254, 171),
              padding: const EdgeInsets.all(4.0),
              label: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    categoria.strCategoryThumb ?? '', 
                    width: 70, 
                    height: 70, 
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 6.0), 
                  Text(
                    categoria.strCategory ?? '', 
                    style: const TextStyle(
                      color: Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
